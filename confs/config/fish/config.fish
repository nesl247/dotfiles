# Path to your oh-my-fish.
set -g OMF_PATH /Users/harrison/.local/share/omf

# Path to your oh-my-fish configuration.
set -g OMF_CONFIG /Users/harrison/.config/omf

### Configuration required to load oh-my-fish ###
# Note: Only add configurations that are required to be set before oh-my-fish is loaded.
# For common configurations, we advise you to add them to your $OMF_CONFIG/init.fish file or
# to create a custom plugin instead.

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# Custom Path
set -gx GOPATH $HOME/.go

set -gx PATH /usr/local/opt/coreutils/libexec/gnubin ~/Code/scripts ~/.composer/vendor/bin ./vendor/bin ./bin $GOPATH/bin /usr/local/sbin $PATH
set -gx EDITOR (which nano)
set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

alias php7 "/usr/local/opt/php70/bin/php"
alias hcomposer "hhvm /usr/local/bin/composer"

function fish_right_prompt
end

function -e fish_preexec _run_fasd
  fasd --proc (fasd --sanitize "$argv") > "/dev/null" 2>&1
end

function z
  cd (fasd -d -e 'printf %s' "$argv")
end

complete -c z --no-files -a (printf "%s " (fasd -ld))

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# enhancd
source $HOME/.enhancd/fish/enhancd.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

if test -z $TMUX
  tmux attach -t default; or tmux new -s default
end
