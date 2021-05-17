module.exports = {
  root: true,
  env: {
    node: true,
    'jest/globals': true
  },
  plugins: ['eslint-plugin-jest'],
  extends: [
    'plugin:vue/vue3-essential',
    '@vue/standard',
    '@vue/typescript/recommended',
    'plugin:jest/all'
  ],
  parserOptions: {
    ecmaVersion: 2020
  },
  rules: {
    'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    'jest/lowercase-name': 'off',
    'jest/prefer-expect-assertions': 'off'
  }
}
