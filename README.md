# shell-scripts

A collection of shell scripts I use to increase productivity.

---
## create-express-api.sh
Automates the setup of a basic HTTP server built on Express.js.
Includes initialization of `package.json`, dependency installs, directory
structure, and all boilerplate code needed to get up and running ASAP.
Once run, you can immediately start the server on port 8080 with
`yarn dev` or `yarn run`.
#### Usage
```shell
sh create-express-api.sh
```

## create-node-basic.js
Automates the setup of a bare-bones Node.js workspace. Initializes `package.json`, installs dependencies, creates directory structure, and writes the `.gitignore`.
#### Usage
```shell
sh create-node-basic.sh
```

## create-node-script.sh
Generates a Node.js script file in either `./app/scripts` or `./scripts`,
if they exist. If they do not, no script file will be created.
#### Usage
```shell
sh create-node-script.sh scriptName
```

## create-ts-basic.sh
Automates the setup of a bare-bones TypeScript application.
Initializes `package.json`, installs dependencies, creates directory structure,
and writes the `.gitignore` and `tsconfig.json`.
#### Usage
```shell
sh create-ts-basic.sh
```

## file-splitter.sh
Splits a large CSV into (potentially) many smaller CSVs, preserving headers. The size of each chunked CSV is determined by the second parameter. Outputs the resulting CSVs to a subdirectory `split/` residing in the directory where this script is invoked.
#### Usage
```shell
sh file-splitter.sh ~/path-to-file/extremely-large.csv 20000
```

## node-runner.sh (in progress)
Runs a Node.js script, and afterwards logs the total run-time as well as the peak memory pressure.
#### Usage
```shell
sh node-runner.sh ~/path-to-file/script.js scriptArgs
```
---
