export PATH="/opt/hostedtoolcache/Python/$PYTHON_VERSION/x64/bin:$PATH"
pip3.7 install -q pipenv
echo "::add-path::/opt/hostedtoolcache/Python/$PYTHON_VERSION/x64/bin"
