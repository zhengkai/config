module.exports = {
	plugins: ['@typescript-eslint'],
	parser: '@typescript-eslint/parser',
	extends: ['eslint:recommended', 'plugin:@typescript-eslint/recommended'],
	parserOptions: {
		ecmaVersion: 2019,
		sourceType: 'module',
		ecmaFeatures: {
			impliedStrict: true,
		},
	},
	env: {
		es6: true,
		node: true,
	},
	rules: {
		quotes: ['error', 'single'],
		semi: 'error',
		indent: ['error', 'tab', {
			ArrayExpression: 1,
			CallExpression: { arguments: 1 },
			outerIIFEBody: 0,
			SwitchCase: 1,
		}],
		curly: 'error',
		'no-unneeded-ternary': 'error',
		'array-bracket-spacing': ['error', 'never'],
		'arrow-spacing': 'error',
		'block-spacing': 'error',
		'comma-dangle': ['error', 'always-multiline'],
		'comma-spacing': ['error', { before: false, after: true }],
		'comma-style': 'error',
		'func-call-spacing': ['error', 'never'],
		'brace-style': ["error", "1tbs", { "allowSingleLine": false }],
		'key-spacing': 'error',
		'keyword-spacing': 'error',
		'no-constant-condition': 'off',
		'no-empty': ['error', { allowEmptyCatch: true }],
		'no-multi-spaces': 'error',
		'no-unused-vars': ['warn', { varsIgnorePattern: '_', args: 'none' }],
		'no-var': 'error',
		'object-curly-spacing': ['error', 'always'],
		'prefer-arrow-callback': 'error',
		'prefer-const': 'error',
		'quote-props': ['error', 'as-needed'],
		'space-in-parens': 'error',
		'space-infix-ops': ['error', { int32Hint: false }],
		'space-before-blocks': 'error',
	},
};
