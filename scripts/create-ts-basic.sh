# Automates the setup of a bare-bones TypeScript application.
# Initializes package.json, installs dependencies, creates
# directory structure, and writes the .gitignore and tsconfig.
#
# Invoke the script like this:
# sh create-ts-basic.sh

# Initialize package.json
yarn init -y &&

# Install dependencies
yarn add dotenv
yarn add -D nodemon typescript @types/node

# Update package.json
npm pkg set main='dist/app/app.js' version='0.0.1' scripts.build='tsc' scripts.dev='nodemon dist/app/app.js' scripts.run='node dist/app/app.js' type='module'

# Create directory structure
mkdir app config

# Create empty files
touch app/app.ts config/index.ts .env

# Write .gitignore
echo ".env
.idea
.vscode
node_modules" > .gitignore

# Write tsconfig.json
echo "{
  \"compilerOptions\": {
    \"target\": \"ESNext\",
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
