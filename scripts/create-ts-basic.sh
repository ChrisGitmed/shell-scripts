# Automates the setup of a bare-bones TypeScript application.
# Initializes the package.json, creates directory structure, and
# installs two dev dependencies for the project, typescript and nodemon.

# Initialize package.json
yarn init -y &&

# Install dependencies
yarn add -D nodemon typescript

# Update package.json
npm pkg set main='dist/app/app.js' &&
npm pkg set scripts.build='tsc' &&
npm pkg set scripts.dev='nodemon dist/app/app.js' &&
npm pkg set scripts.run='node dist/app/app.js' &&
npm pkg set type='module' &&

# Create directory structure
mkdir app config

# Create empty files
touch app/app.ts config/index.ts .env

# Create .gitignore
echo ".env
.idea
.vscode
node_modules" > .gitignore &&

# Create tsconfig.json
echo "{
  \"compilerOptions\": {
    \"target\": \"ES2015\",                            /* Set the JavaScript language version for emitted JavaScript and include compatible library declarations. */
    \"module\": \"Node16\",                            /* Specify what module code is generated. */
    \"esModuleInterop\": true,                       /* Emit additional JavaScript to ease support for importing CommonJS modules. This enables 'allowSyntheticDefaultImports' for type compatibility. */
    \"forceConsistentCasingInFileNames\": true,      /* Ensure that casing is correct in imports. */
    \"strict\": true,                                /* Enable all strict type-checking options. */
    \"skipLibCheck\": true,                          /* Skip type checking all .d.ts files. */
    \"outDir\": \"dist\"                               /* Specify output directory. */
  },
  \"include\": [\"app/**/*\", \"config/*\"]              /* Specify files to include in build. */
}" > tsconfig.json

echo "Fin!"
