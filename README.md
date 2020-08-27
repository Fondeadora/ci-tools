# CI Tools

![licensed|ethically](https://img.shields.io/badge/licensed-ethically-%234baaaa "Ethically licensed badge")

This repository contains several scripts that automate common tasks executed in within CI

## How to use

### Lint Python project

Add the following to your workflow:

```yaml
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/cache@v2
        id: cache-dependencies
        with:
          path: .venv
          key: ${{ runner.os }}-pip-${{ hashFiles('**/Pipfile.lock') }}
          restore-keys: |
            ${{ runner.os }}-pip-${{ hashFiles('**/Pipfile.lock') }}
      - name: lint
        uses: Fondeadora/ci-tools/lint
        with:
          access_token: ${{ secrets.ACCESS_TOKEN }}
          cache_hit: ${{ steps.cache-dependencies.outputs.cache-hit }}
```

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

### Test

Add to your github workflow the following snippet:

```sh
name: A service to test

on: pull_request

jobs:

  test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout the repo
        uses: actions/checkout@v2

      - name: Check if we hace cached dependencies
        uses: actions/cache@v2
        id: cache-dependencies
        with:
          path: .venv
          key: ${{ runner.os }}-pip-${{ hashFiles('**/Pipfile.lock') }}
          restore-keys: |
            ${{ runner.os }}-pip-${{ hashFiles('**/Pipfile.lock') }}

      - name: Test the service
        uses: Fondeadora/ci-tools/test@master
        with:
          access_token: ${{ secrets.ACCESS_TOKEN }}
          cache_hit: ${{ steps.cache-dependencies.outputs.cache-hit == 'true' }}
          env_file: .env.example
          test_command: pipenv run make test

```