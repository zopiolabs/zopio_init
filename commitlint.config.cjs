module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    // Enforce conventional commit types used in the GitHub workflows
    'type-enum': [
      2,
      'always',
      [
        'feat',     // New feature
        'fix',      // Bug fix
        'docs',     // Documentation only changes
        'style',    // Changes that do not affect the meaning of the code
        'refactor', // Code change that neither fixes a bug nor adds a feature
        'perf',     // Performance improvements
        'test',     // Adding missing tests or correcting existing tests
        'build',    // Changes that affect the build system or external dependencies
        'ci',       // Changes to CI configuration files and scripts
        'chore',    // Other changes that don't modify src or test files
        'revert',   // Reverts a previous commit
        'release'   // Release commits
      ]
    ],
    // Allow these scopes (based on pr-validation.yml)
    'scope-enum': [
      2,
      'always',
      [
        'api',
        'app',
        'auth',
        'build',
        'ci',
        'cli',
        'core',
        'crud',
        'data',
        'database',
        'deps',
        'design-system',
        'docs',
        'email',
        'i18n',
        'infra',
        'monitoring',
        'payments',
        'security',
        'studio',
        'tests',
        'ui',
        'web',
        'workspace',
        'release', // For release commits
        'sync'     // For branch sync commits
      ]
    ],
    // Scope is optional
    'scope-empty': [2, 'never'],
    // Subject must not be empty
    'subject-empty': [2, 'never'],
    // Subject must not start with uppercase (matching GitHub workflow validation)
    'subject-case': [2, 'always', 'lower-case'],
    // Subject max length
    'subject-max-length': [2, 'always', 100],
    // Body line max length
    'body-max-line-length': [2, 'always', 100],
    // Footer line max length
    'footer-max-line-length': [2, 'always', 100]
  }
};