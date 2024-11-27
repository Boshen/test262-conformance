const { transform } = require('oxc-transform');

const target = process.env.TARGET || 'node22'

console.log('target: ', target);

module.exports = function (test) {
  const result = transform(test.file, test.contents, {
    sourceType: test.attrs.flags.module ? 'module' : 'script',
    target
  });

  if (result.errors.length == 0) {
    test.contents = result.code;
  } else {
    let error = result.errors[0];
    test.result = {
      stderr: `SyntaxError: ${error}`,
      stdout: '',
      error: new SyntaxError(error)
    };
  }

  return test;
};
