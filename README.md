# shell-scripts

A collection of shell scripts I use to increase productivity.

---
## create-node-api.sh
Creates a Node.js HTTP server in the directory this script is invoked. Includes subdirectory structure, dependency installs, router, error handlers, a linter based on the AirBnB JS style guide, and more. Once run, you can immediately run `yarn dev` to start the server on port 8080.
#### Usage
```
sh .../create-node-api.sh
```

## create-node-script.sh
Creates a basic Node.js script file in `./app/scripts/`, if the directory exists, if it does not, it creates the file in `./scripts/`, if that directory does not exist either, no file will be created. The desired script name is the only parameter.
#### Usage
```
sh .../create-node-script.sh scriptName
```

## file-splitter.sh
Splits a large CSV into multiple smaller CSVs, preserving headers. The size of each chunked CSV is determined by the second parameter. Outputs the resulting CSVs to a subdirectory `split/` residing in the directory where this script is invoked.
#### Usage
```
sh .../file-splitter.sh extremely-large.csv 2000
```
