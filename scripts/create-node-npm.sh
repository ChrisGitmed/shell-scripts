# An extremely simple script to get started writing a npm package.
# Adds a package.json, changes the type to module, and creates 
# index.js file. Class name is passed in as an argument.
#
# Example:
# sh .../create-npm-package.sh Shade

# Install dependencies
npm init -y

mkdir tests

# Update package.json
npm pkg set type='module'

# Write app/components/template/index.js
echo "export class $1 {
}
" > index.js

echo 'Fin.'
