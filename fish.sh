# fish
which fish >/dev/null 2>&1 && curl -L https://get.oh-my.fish | fish
fish -c "omf install https://github.com/jhillyerd/plugin-git"
fish -c "omf install bobthefish"

set fish_path (which fish)
echo "Add fish pach to /etc/shells"
sudo sh -c "echo $fish_path >> /etc/shells"
echo "chsh -s $fish_path"
chsh -s $fish_path
