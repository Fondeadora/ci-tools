# CI Tools

![licensed|ethically](https://img.shields.io/badge/licensed-ethically-%234baaaa "Ethically licensed badge")

This repository contains several scripts that automate common tasks executed in within CI

## How to use

### Git consistency

- [Script](bash/git-consistency.sh)

Add to your github workflow the following snippet:

```sh
name: Git consistency

on: pull_request

jobs:

  consistency:
    runs-on: ubuntu-latest
    steps:
    - name: Get current project to validate
      uses: actions/checkout@v2
      with:
        path: project

    - name: Get ci tools script
      uses: actions/checkout@v2
      with:
        repository: Fondeadora/ci-tools
        ref: master
        token: ${{ secrets.CI_TOOLS_TOKEN }}
        path: ci-tools

    - name: Setup repository references
      run: |
        cd project
        git fetch origin
        git checkout ${{ github.base_ref }}
        git checkout ${{ github.head_ref }}

    - name: Run git consistency tools
      env: 
        BASE_BRANCH: ${{ github.base_ref }}
        CURRENT_BRANCH: ${{ github.head_ref }}
        REPO_TYPE: "mobile|service" # set to the correct value
      run: |
        cd project
        ../ci-tools/validation/git-consistency.sh
```
