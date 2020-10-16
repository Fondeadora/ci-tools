export PATH="/opt/hostedtoolcache/Python/$PYTHON_VERSION/x64/bin:$PATH"
pip3.7 install -q pipenv
echo "/opt/hostedtoolcache/Python/$PYTHON_VERSION/x64/bin" >> $GITHUB_PATH
