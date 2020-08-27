if [ $CACHE_HIT != 'true' ]; then
    PIPENV_VENV_IN_PROJECT=1 pipenv sync --dev
fi
