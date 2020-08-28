#!/bin/bash
#
# Install the project dependencies with the given command.
# By default it will install dependencies with Pipenv,
# optionally you can pass the flag -d followed by the
# desired command to install the dependencies.

install_pipenv_dependencies() {
    PIPENV_VENV_IN_PROJECT=1 pipenv sync --dev
}

DEPS_COMMAND=install_pipenv_dependencies

usage() {
    echo "Usage: $0 [-d DEPS_COMMAND]" 1>&2
}

exit_abnormal() {
  usage
  exit 1
}

while getopts ':d:' flag; do
    case "${flag}" in
        d) DEPS_COMMAND=${OPTARG} ;;
        :)
            echo "Error: -${OPTARG} requires an argument."
            exit_abnormal
            ;;
        *)
            exit_abnormal
            ;;
    esac
done

if [[ $CACHE_HIT != 'true' ]]; then
    COMMAND_OUTPUT="$($DEPS_COMMAND)"
    RETURN_VALUE=$?

    if [[ $RETURN_VALUE != 0 ]]; then
        exit $RETURN_VALUE
    fi

    echo $COMMAND_OUTPUT
fi
