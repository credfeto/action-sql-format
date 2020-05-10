# Reformat SQL Files

Reformats TSQL files using [Poor Man's TSQL Formatter](http://architectshack.com/PoorMansTSqlFormatter.ashx).

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
      - uses: actions/checkout@v2
      with:
        fetch-depth: 0
      # Run the reformat action
      - name: Reformat SQL Files
        uses: credfeto/action-sql-format@master
      - name: Commit files
        run: |
          git config --local user.email "<githubusername>@users.noreply.github.com"
          git config --local user.name "SQL Reformat Bot"
          git commit --all -m"Reformat SQL Files to common format." || true
      - name: Push
        run: git push "https://${{github.actor}}:${{secrets.SOURCE_PUSH_TOKEN}}@github.com/${{github.repository}}.git" "HEAD:${{ env.GIT_BRANCH }}"
```

On each push, it will reformat the SQL.  Note you'll need to commit and push any commits back to your github repo. 
