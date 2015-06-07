# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme Settings
set theme_display_ruby no
set theme_display_virtualenv no
set theme_display_user yes
set default_user harrison

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Theme
Theme "clearance"

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
