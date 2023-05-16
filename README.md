# Reformat SQL Files

## How to use it?
This is a GitHub action, so it has to be added to a GitHub workflow.  

A simple example of running this action on all pushes to the repository would be to
add a `reformatsql.yml` file under `.github/workflows` with the following content

```yaml
on: [push]

jobs:
  reformat-sql:
    runs-on: ubuntu-latest
    steps:
      # Checkout the source code there are have some files to look at.
      - uses: actions/checkout@v2
        with:
          fetch-depth: 0
          token: ${{secrets.SOURCE_PUSH_TOKEN}}
          
      # Run the reformat action
      - name: Reformat SQL Files
        uses: credfeto/action-sql-format@v1.4.1
        
      # Commit any changes to the repo
      - uses: stefanzweifel/git-auto-commit-action@v4.16.0
        with:
          commit_message: "[Reformat] SQL Files to common format"
          file_pattern: "*.sql"
          commit_user_name: "sqlfmt[bot]"
          commit_user_email: "github-username@users.noreply.github.com"
          commit_author: "sqlfmt[bot] <github-username@users.noreply.github.com>"
          skip_dirty_check: false
```

On each push, it will reformat the SQL.  Note you'll need to commit and push any commits back to your GithHub repo. 

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->