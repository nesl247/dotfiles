# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
#set fish_theme robbyrussell
set fish_theme clearance

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Theme Settings
set theme_display_ruby no
set theme_display_virtualenv no
set theme_display_user yes
set default_user harrison

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Custom Path
set -U fish_user_paths /usr/local/opt/coreutils/libexec/gnubin ~/Code/scripts ~/.composer/vendor/bin ./vendor/bin $fish_user_paths

set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

if test -x /usr/local/bin/brew
	set brew_prefix (brew --prefix homebrew/php/php56)
	if test -d $brew_prefix/bin
		#set my_paths $my_paths $brew_prefix/bin
		set -U fish_user_paths $fish_user_paths $brew_prefix/bin
	end
end

# Aliases
if test -e /usr/local/bin/hub
	alias git "hub"
end
