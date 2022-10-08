# Automates the setup of a bare-bones Node.js workspace.
# Initializes package.json, installs basic dependencies, creates
# directory structure, and writes the .gitignore.
#
# Invoke the script like this:
# sh create-node-basic.sh

# Initialize package.json
npm init -y

# Install dependencies
yarn add dotenv
yarn add -D nodemon

# Update package.json
npm pkg set main='app/app.js' version='0.0.1' scripts.dev='nodemon app/app.js' scripts.run='node app/app.js' type='module'

# Build directory structure
mkdir app config

# Create empty files
touch app/app.js config/index.js .env .gitignore

# Write .gitignore
echo ".env
.idea
.vscode
node_modules" > .gitignore

echo 'Fin!'
