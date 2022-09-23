# Creates a basic HTTP server built on Express.js
# Includes creating subdirectory structure, installing dependencies,
# and everything else needed for a bare-bones API.
#
# Run this script from the folder you wish to create the API.

# Create subdirectory structure
mkdir app config app/components app/router

# Install dependencies
npm init -y &&
yarn add express dotenv knex morgan &&
yarn add -D nodemon eslint &&

# Update package.json
npm pkg set scripts.dev='nodemon app/app.js' &&
npm pkg set type='module' &&

# Write .gitignore
echo '.env
node_modules
.vscode
.idea
' > .gitignore &&

# Write .env
echo 'NODE_ENV=localhost
PORT=8080' > .env &&

# Write .eslint
echo '{
    "extends": "eslint:recommended",
    "parserOptions": {
        "ecmaVersion": "latest",
        "sourceType": "module",
        "ecmaFeatures": {}
    },
    "rules": {
        "no-const-assign": 2,
        "no-duplicate-imports": 2,
        "no-unused-vars": [2, { "ignoreRestSiblings": true }],
        "no-var": 2,
        "prefer-const": 2,
        "no-new-object": 2,
        "object-shorthand": 2,
        "no-prototype-builtins": 2,
        "prefer-object-spread": 2,
        "no-array-constructor": 2,
        "array-callback-return": 2,
        "prefer-destructuring": 2,
        "prefer-template": 2,
        "template-curly-spacing": 2,
        "no-eval": 2,
        "no-useless-escape": 2,
        "func-style": 2,
        "wrap-iife": 2,
        "no-loop-func": 2,
        "prefer-rest-params": 2,
        "default-param-last": 2,
        "default-case-last": 2,
        "no-new-func": 2,
        "space-before-function-paren": 2,
        "space-before-blocks": 2,
        "no-param-reassign": 2,
        "prefer-spread": 2,
        "function-paren-newline": 2,
        "prefer-arrow-callback": 2,
        "arrow-spacing": 2,
        "arrow-parens": ["error", "always"],
        "arrow-body-style": 2,
        "no-confusing-arrow": ["error", { "allowParens": true }],
        "implicit-arrow-linebreak": 2,
        "no-useless-constructor": 2,
        "no-dupe-class-members": 2,
        "class-methods-use-this": 2,
        "object-curly-newline": 2,
        "no-iterator": 2,
        "no-restricted-syntax": 2,
        "generator-star-spacing": 2,
        "dot-notation": 2,
        "no-restricted-properties": 2,
        "one-var": ["error", "never"],
        "no-multi-assign": 2,
        "operator-linebreak": 2,
        "eqeqeq": 2,
        "no-case-declarations": 2,
        "no-unneeded-ternary": 2,
        "no-mixed-operators": 2,
        "nonblock-statement-body-position": 2,
        "brace-style": 2,
        "no-else-return": 2,
        "spaced-comment": ["error", "always", { "markers": ["/"] } ],
        "indent": ["error", 2, { "SwitchCase": 1 }],
        "keyword-spacing": 2,
        "space-infix-ops": 2,
        "eol-last": 2,
        "no-whitespace-before-property": 2,
        "space-in-parens": 2,
        "array-bracket-spacing": 2,
        "object-curly-spacing": ["error", "always"],
        "block-spacing": 2,
        "comma-spacing": 2,
        "computed-property-spacing": 2,
        "func-call-spacing": 2,
        "key-spacing": 2,
        "no-trailing-spaces": 2,
        "comma-style": 2,
        "comma-dangle": ["error", "always-multiline"],
        "semi": 2,
        "no-new-wrappers": 2,
        "no-underscore-dangle": ["error", { "allow": ["_readableState"] }],
        "new-cap": 2,
        "no-restricted-globals": 2,
        "quote-props": ["error", "as-needed"],
        "quotes": ["error", "single"],
        "no-undef": 2,
        "padded-blocks": ["error", "never"],
        "no-multiple-empty-lines": ["error", { "max": 3 }],
        "radix": 2,
        "id-length": 2,
        "max-len": 2,
        "camelcase": 2,
        "no-nested-ternary": 2,
        "no-plusplus": ["error", { "allowForLoopAfterthoughts": true }]
    },
    "env": {
        "node": true,
        "es6": true
    }
}
' > .eslintrc.json &&

# Write app/app.js
echo "import express from 'express';
import morgan from 'morgan';

import config from '../config/index.js';
import routes from './router/index.js';

const app = express();

class Application {
  constructor () {
    app.use(express.json())
      .use(morgan('dev'))
      .use('/api', routes);
    this.app = app;
  }

  async start (port) {
    process.on('uncaughtException', (err) => console.error('Top-Level exception', err, err.stack));

    return new Promise((resolve, reject) => {
      this.app.listen(port, async (err) => {
        if (err) {
          console.log(err);
          reject(err);
        }
        console.info(\`Server listening on port: \${port}\`);
        resolve();
      });
    });
  }
}

(async () => await new Application().start(config.port))();
" > app/app.js &&

# Write app/router/index.js
echo "import express from 'express';

const router = express.Router();

// Health check
router.get('/v1/healthcheck', async (req, res) => res.status(200).send('<img src =\"https://http.cat/200\"/>'));

export default router;
" > app/router/index.js &&

# Write config/index.js
echo "import dotenv from 'dotenv';
dotenv.config()

const config = {
  NODE_ENV: process.env.NODE_ENV,
  port: process.env.PORT,
};

export default config;
" > config/index.js &&

echo '\nFin! 🚀\n'
