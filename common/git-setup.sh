git config credential.helper store --file .git/credentials
git config --list --show-origin
echo -e "https://tech-fondeadora:$ACCESS_TOKEN@github.com" | sudo tee -a /etc/git-credentials
echo -e "https://tech-fondeadora:$ACCESS_TOKEN@github.com" | sudo tee -a ~/.git-credentials
echo -e "https://tech-fondeadora:$ACCESS_TOKEN@github.com" | sudo tee -a .git/credentials

echo -e "[url \"https://$ACCESS_TOKEN@github.com/\"]\n\tinsteadOf = ssh://git@github.com/" | sudo tee -a /etc/gitconfig
echo -e "[url \"https://$ACCESS_TOKEN@github.com/\"]\n\tinsteadOf = ssh://git@github.com/" | sudo tee -a ~/.gitconfig
echo -e "[url \"https://$ACCESS_TOKEN@github.com/\"]\n\tinsteadOf = ssh://git@github.com/" | sudo tee -a .git/config

echo "/etc/gitconfig"
cat /etc/gitconfig
echo ".git/config"
cat .git/config
echo "~/.gitconfig"
cat ~/.gitconfig

echo "/etc/git-credentials"
cat /etc/git-credentials
echo "~/.git-credentials"
cat ~/.git-credentials
echo ".git/credentials"
cat .git/credentials