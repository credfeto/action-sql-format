# Reformat SQL Files

## How to use it?
This is a Github action, so it has to be added to a github workflow.  

A simple example of running this action on all pushes to the repository would be
add a `reformatsql.yml` file under `.github/workflows` with the following content
```yaml
on: [push]

jobs:
  reformat-sql:
    runs-on: ubuntu-latest
    steps:
      # Checkout the source code so we have some files to look at.
      - uses: actions/checkout@v1
      # Run the reformat action
      - name: Reformat SQL Files
        uses: credfeto/action-sql-format@master
```

On each push, it will now install the version of dotnet core specified in src/global.json, install it and build the source
