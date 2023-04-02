# Automates the setup of a basic HTTP server built on Express.js.
# Includes initialization of package.json, dependency installs, directory
# structure, and all boilerplate code needed to get up and running ASAP.
# Once run, you can immediately start the server with 'yarn dev' or 'yarn run'.
# 
# Invoke the script like this
# sh create-node-api.sh

# Initialize package.json
npm init -y

# Install dependencies
yarn add express dotenv morgan &&
yarn add -D dark-args eslint helmet nodemon js-shade &&

# Update package.json
npm pkg set main='app/app.js' version='0.0.1' scripts.dev='nodemon app/app.js'  scripts.run='node app/app.js'  type='module' &&

# Create subdirectory structure
mkdir app config app/components app/components/template app/lib app/middleware app/router app/scripts app/util && 

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
    "new-cap": 0,
    "no-restricted-globals": 2,
    "quote-props": ["error", "as-needed"],
    "quotes": ["error", "single"],
    "no-undef": 2,
    "padded-blocks": ["error", "never"],
    "no-multiple-empty-lines": ["error", { "max": 3 }],
    "radix": 2,
    "id-length": 2,
    "max-len": 0,
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
import helmet from 'helmet';
import morgan from 'morgan';

import { config } from '../config/index.js';
import { ErrorMiddleware } from './middleware/index.js';
import { isMain } from './util/index.js';
import { router } from './router/index.js';


class Application {
  /// Application
  static app = express()
    .use(express.json())
    .use(express.urlencoded({ extended: true }))
    .use(helmet())
    .use(morgan('dev'))
    .use('/api', router)
    .use(ErrorMiddleware.handleErr());


  /// Start
  static start = async (port) => {
    process.on('uncaughtException', (err) => console.error('Top-Level exception', err, err.stack));

    return new Promise((resolve, reject) => {
      console.log(\`API listening on port: \${port}\`)
      this.app.listen(port, async (err) => {
        if (err) {
          console.error(err);
          reject(err);
        }
        console.log();
      });
      resolve();
    });
  };
}


(async () => {
  // If invoked directly from the command line...
  if (isMain(import.meta.url)) await Application.start(config.port);
})();

export const { app } = Application;
" > app/app.js &&


# Write app/components/template/index.js
echo "class Template {
  static get = async () => {
    console.log('get');
    return 'get';
  };

  static create = async () => {
    console.log('create');
    return 'create';
  };

  static update = async () => {
    console.log('update');
    return 'update';
  };

  static destroy = async () => {
    console.log('delete');
    return 'delete';
  };
}

export { Template };
" > app/components/template/index.js &&

# Write app/components/template/routes.js
echo "import { asCallback } from '../../util/index.js';
import { errHandler } from '../../lib/index.js';
import { router } from '../../router/index.js';
import { Template } from './index.js';

const bodyPropertyList = [
  'prop1',
  'prop2',
  'prop3',
];

// Get
router.get(
  '/template',
  async (req, res, next) => {
    const [err, results] = await asCallback(Template.get());
    if (err) return errHandler(err, next, 'Template.get');
    return res.status(200).json(results);
  },
);

// Create
router.post(
  '/template',
  async (req, res, next) => {
    const payload = pick(req.body, bodyPropertyList);
    const [err, resultUUID] = await asCallback(Template.create(payload));
    if (err) return errHandler(err, next, \`Template.create: \${JSON.stringify(payload)}\`);
    return res.status(201).json(resultUUID);
  },
);

// Update
router.put(
  '/template/:uuid',
  async (req, res, next) => {
    const { uuid } = req.params;
    const payload = pick(req.body, bodyPropertyList);
    const [err, results] = await asCallback(Template.update(uuid, payload));
    if (err) return errHandler(err, next, \`Template.update: \${uuid}, \${JSON.stringify(payload)}\`);
    return res.status(200).json(results);
  },
);

// Delete
router.delete(
  '/template/:uuid',
  async (req, res, next) => {
    const { uuid } = req.params;
    const [err, results] = await asCallback(Template.destroy(uuid));
    if (err) return errHandler(err, next, \`Template.destroy: \${uuid}\`);
    return res.status(200).json(results);
  },
);
" > app/components/template/routes.js &&

# Write app/lib/index.js
echo "import {
  Err,
  errHandler,
} from './error.js';

export {
  Err,
  errHandler,
};
" > app/lib/index.js

# Write app/lib/error.js
echo "class Err extends Error {
  constructor ({
    message,
    code = 500,
    context = '',
  }) {
    super(message);
    this.code = code;
    this.context = context;
    Error.captureStackTrace(this, this.constructor);
  }
}

const errHandler = (err, next, context = 'No context provided') => {
  if (err instanceof Err) return next(err);
  return next(new Err({
    message: err,
    code: 500,
    context,
  }));
};

export { Err, errHandler };
" > app/lib/error.js &&

# Write app/middleware/index.js
echo "import { ErrorMiddleware } from './error.js';


export {
  ErrorMiddleware,
};
" > app/middleware/index.js &&

# Write app/middleware/error.js
echo "import {
  Err,
} from '../lib/index.js';


class ErrorMiddleware {
  // VALIDATE
  static handleErr () {
    return async (err, req, res, next) => {
      if (res.headersSent) return next(err);

      // Known Error
      if (err instanceof Err) {
        console.log('|********************************|');
        console.log('  ::: ERR    : ', err.uuid);
        console.log('  ::: CODE   : ', err.code);
        console.log('  ::: CNTX   : ', err.context);
        console.log('  ::: PATH   : ', err.path);
        console.log('  ::: IP     : ', err.ip_address);
        console.log('  ::: U_AG   : ', err.user_agent);
        console.log('  ::: TIME   : ', err.request_time_stamp);
        console.log('  ::: MSG    : ', err.message);
        console.log('|********************************|');
        console.log('  ::: STK    : ', err.stack);
        console.log('|********************************|');
        console.log('');
        console.log('');

        return res.status(err.code).json({ message: err.message });
      }

      // Unknown error
      console.log('|********************************|');
      console.log('  ::: UNKNOWN ');
      console.log('  ::: CODE    : ', err.code);
      console.log('  ::: MSG     : ', err.message);
      console.log('|********************************|');
      console.log('');
      console.log('');

      return res.status(500).json({ message: \`Unknown error occurred: \${err.message}\` });
    };
  }
}


export { ErrorMiddleware };
" > app/middleware/error.js &&

# Write app/util/as-callback.js
echo "const asCallback = (promise) => promise
  .then((data) => [null, data])
  .catch((err) => [err]);

export { asCallback };
" > app/util/as-callback.js &&

# Write app/util/is-main.js
echo "import { fileURLToPath } from 'url';
import { resolve } from 'path';

const isMain = (moduleUrl) => {
  const modulePath = resolve(fileURLToPath(moduleUrl));
  const mainScriptPath = resolve(process.argv[1]);
  const scriptPathEnd = mainScriptPath.split('/').slice(-3).join('/');
  return (modulePath === mainScriptPath) ||
    scriptPathEnd === 'pm2/lib/ProcessContainerFork.js'; // Hacky way of saying 'If PM2 is calling this then it is main'
};

export { isMain };
" > app/util/is-main.js &&

# Write app/util/index.js
echo "import { asCallback } from './as-callback.js';
import { isMain } from './is-main.js';

export {
  asCallback,
  isMain,
};
" > app/util/index.js &&

# Write app/router/index.js
echo "import express from 'express';
import { fileURLToPath, pathToFileURL } from 'url';
import fs from 'fs';
import path from 'path';

const router = express.Router();

// Health check
router.get('/healthcheck', async (req, res) => res.status(200).send('<img src ="https://http.cat/200"/>'));

// Automatically load all "routes" files found under their respective component folders
const filename = fileURLToPath(import.meta.url);
const dirname = path.dirname(filename);
const basePath = path.join(dirname, '../components');
fs.readdirSync(basePath, { withFileTypes: true })
  .filter((file) => file.isDirectory())
  .map((dir) => dir.name)
  .forEach((componentName) => {
    const componentPath = pathToFileURL(\`\${basePath}/\${componentName}/routes.js\`);
    if (fs.existsSync(componentPath)) import(componentPath);
  });

export { router };
" > app/router/index.js &&

# Write config/index.js
echo "import dotenv from 'dotenv';
dotenv.config()

export const config = {
  NODE_ENV: process.env.NODE_ENV,
  port: process.env.PORT,
};
" > config/index.js &&

echo 'Fin!'
