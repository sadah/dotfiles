# fish
which fish >/dev/null 2>&1 && curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fish -c "omf install https://github.com/jhillyerd/plugin-git"
fish -c "omf install bobthefish"

set fish_path (which fish)

if grep -q "fish" /etc/shells
    echo "Found fish in /etc/shells"
else
    echo "Add fish path to /etc/shells"
    sudo sh -c "echo $fish_path >> /etc/shells"
end

echo "chsh -s $fish_path"
chsh -s $fish_path
