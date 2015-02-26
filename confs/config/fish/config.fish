# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
#set fish_theme robbyrussell
set fish_theme bobthefish

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load plugins
set fish_plugins git tab

# Theme Settings
set theme_display_ruby no
set theme_display_virtualenv no
set theme_display_user yes
set default_user harrison

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Custom Path
set -U fish_user_paths /usr/local/opt/coreutils/libexec/gnubin $fish_user_paths
set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
set -U fish_user_paths $fish_user_paths ~/Code/scripts
set -U fish_user_paths $fish_user_paths ~/.composer/vendor/bin
set fish_user_paths $fish_user_paths ./vendor/bin

if test -e /usr/local/bin/brew
	if test -d (brew --prefix homebrew/php/php56)/bin
		set -U fish_user_paths $fish_user_paths (brew --prefix homebrew/php/php56)/bin
	end
end

# Aliases
if test -e /usr/local/bin/hub
	alias git "hub"
end
