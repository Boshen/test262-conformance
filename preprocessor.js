const { transform } = require('oxc-transform');

module.exports = function (test) {
  const result = transform(test.file, test.contents, {
    sourceType: test.attrs.flags.module ? 'module' : 'script',
    target: 'node22'
  });

  if (result.errors.length == 0) {
    test.contents = result.code;
  } else {
    let error = result.errors[0];
    test.result = {
      stderr: `SyntaxError: ${error}`,
      stdout: '',
      error: new Error(error)
    };
  }

  return test;
};
