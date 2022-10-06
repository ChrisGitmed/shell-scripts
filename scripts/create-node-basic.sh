# Sets up a simple, no-frills, Node.js workspace with no frills.
# Initializes package.json, installs nodemon as a dev dependency,
# creates directory structure and writes .gitignore.
#
# Invoke the script like this:
# sh .../create-node-basic.sh

# Initialize package.json
npm init -y

# Install dependencies
yarn add -D nodemon

# Update package.json
npm pkg set main='app/app.js' &&
npm pkg set version='0.0.1' &&
npm pkg set scripts.dev='nodemon app/app.js' &&
npm pkg set scripts.run='node app/app.js' &&
npm pkg set type='module' &&

# Build directory structure
mkdir app config

# Create empty files
touch app/app.js config/index.js .env .gitignore

# Write .gitignore
echo ".env
.idea
.vscode
node_modules" > .gitignore &&

echo 'Fin!'
