if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_color_valid_path
set -g theme_color_scheme dracula
set -g theme_date_format "+%Y/%m/%d %H:%M:%S"

# https://github.com/fish-shell/fish-shell/issues/5593
bind \cd delete-char

source $HOME/.alias

# Go
set -gx GOPATH $HOME/go
set -gx PATH $PATH $GOPATH/bin

# Internal Settings
if [ -f './internal.fish' ]; fish ./internal.fish; end