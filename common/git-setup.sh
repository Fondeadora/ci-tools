cat .git/config
echo -e "[url \"https://$ACCESS_TOKEN@github.com/\"]\n\tinsteadOf = ssh://git@github.com/" | sudo tee -a /etc/gitconfig
git config --list --show-origin
cat .git/config
cat /etc/gitconfig
