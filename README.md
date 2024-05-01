# shell-scripts

A collection of shell scripts I use to increase productivity.

---
## [create-express-api.sh](https://github.com/ChrisGitmed/shell-scripts/blob/master/scripts/create-express-api.sh)
Automates the setup of a basic HTTP server built on Express.js.
Includes initialization of `package.json`, dependency installs, directory
structure, and all boilerplate code needed to get up and running ASAP.
Once run, you can immediately start the server on port 8080 with
`yarn dev` or `yarn run`.
#### Usage
```shell
sh create-express-api.sh
```

## [file-splitter.sh](https://github.com/ChrisGitmed/shell-scripts/blob/master/scripts/file-splitter.sh)
Splits a large CSV into (potentially) many smaller CSVs, preserving headers. The size of each chunked CSV is determined by the second parameter. Outputs the resulting CSVs to a subdirectory `split/` residing in the directory where this script is invoked.
#### Usage
```shell
sh file-splitter.sh ~/path-to-file/extremely-large.csv 20000
```

## [node-runner.sh](https://github.com/ChrisGitmed/shell-scripts/blob/master/scripts/node-runner.sh)
Runs a Node.js script, and writes to a text file: logs from the script itself, the total run-time of the script, and the peak memory pressure of the script.
#### Usage
```shell
sh node-runner.sh ~/path-to-script/script.js scriptArgs
```

## [req-stress-tester.sh](https://github.com/ChrisGitmed/shell-scripts/blob/master/scripts/req-stress-tester.sh)
Spams an API endpoint with as many requests as possible within ten seconds. Use responsibly.
#### Usage
```shell
sh req-stress-tester.sh ${endpoint}
```
---
