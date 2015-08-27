# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Theme
Theme 'clearance'
Plugin 'theme'

# Custom Path
set -gx GOPATH $HOME/.go

set -gx PATH /usr/local/opt/coreutils/libexec/gnubin ~/Code/scripts ~/.composer/vendor/bin ./vendor/bin ./bin $GOPATH/bin /usr/local/sbin $PATH

set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

# Aliases
if test -e /usr/local/bin/hub
	alias git "hub"
end

set -gx EDITOR (which nano)

alias php7 "/usr/local/Cellar/php70/7.0.0-rc.1/bin/php"
