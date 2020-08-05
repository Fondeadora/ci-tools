# CI Tools

This repository contains several scripts that automate common tasks executed in within CI

## How to use

### Git consistency

- [Script][bash/git-consistency.sh]

Add to your github workflow the following snippet:

```sh
name: Git consistency

on: pull_request

jobs:

  consistency:
    runs-on: ubuntu-latest
    steps:
    - name: Set repository as working directory
      uses: actions/checkout@v2
      with:
        repository: Fondeadora/ci-tools
        ref: master
        path: ./ci-tools
    - name: Run git consistency tools
      env: 
        BASE_BRANCH: ${{ github.base_ref }}
        REPO_TYPE: "mobile|service"
      run: |
        cp ./ci-tools/validation/git-consistency.sh .
        git-consistency.sh
```
