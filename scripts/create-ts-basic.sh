# Automates the setup of a bare-bones TypeScript application.
# Initializes the package.json, creates directory structure, and
# installs two dev dependencies for the project, typescript and nodemon.

# Initialize package.json
yarn init -y &&

# Install dependencies
yarn add dotenv
yarn add -D nodemon typescript @types/node

# Update package.json
npm pkg set main='dist/app/app.js' &&
npm pkg set scripts.build='tsc' &&
npm pkg set scripts.dev='nodemon dist/app/app.js' &&
npm pkg set scripts.run='node dist/app/app.js' &&
npm pkg set type='module' &&
npm pkg set version='0.0.1' &&

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
    \"target\": \"ES2015\",
    \"module\": \"Node16\",
    \"esModuleInterop\": true,
    \"forceConsistentCasingInFileNames\" : true,
    \"strict\": true,
    \"skipLibCheck\": true,
    \"outDir\": \"dist\",  
    \"watch\": true
  },
  \"include\": [\"app/**/*\", \"config/*\"]
}" > tsconfig.json

echo "Fin!"
