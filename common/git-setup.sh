cat .git/config
git config --global url."https://$ACCESS_TOKEN@github.com/".insteadOf "ssh://git@github.com/"
git config --list --show-origin
cat .git/config
cat /etc/gitconfig
cat /home/runner/.gitconfig
