# Path to your oh-my-fish.
set -g OMF_PATH /Users/harrison/.local/share/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# Custom Path
set -gx GOPATH $HOME/.go
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin ~/Code/scripts ~/.composer/vendor/bin ./vendor/bin ./bin $GOPATH/bin $PATH
set -gx EDITOR (which vim)
set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman /usr/local/share/man /usr/share/man

# Sets LS back to default with GRC plugin
set grcplugin_ls --indicator-style=classify --color -xh

# Aliases
alias php7 "/usr/local/opt/php70/bin/php"
alias hcomposer "hhvm /usr/local/bin/composer"

# Disable the right prompt
#function fish_right_prompt
#end

# fasd support
#function -e fish_preexec _run_fasd
#  fasd --proc (fasd --sanitize "$argv") > "/dev/null" 2>&1
#end

#function z
#  builtin cd (fasd -d -e 'printf %s' "$argv")
#end

#complete -c z --no-files -a (printf "%s " (fasd -ld))

# Command history searching with ctrl + r
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# enhancd
set -gx ENHANCD_FILTER fzf
source $HOME/.enhancd/fish/enhancd.fish
alias z enhancd

# iTerm2 integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Autostart tmux
if test -z $TMUX
#  tmux attach -t default; or tmux new -s default
end
