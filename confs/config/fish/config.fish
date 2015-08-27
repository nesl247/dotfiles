set -g OMF_PATH $HOME/.local/share/omf
set -g OMF_CUSTOM $HOME/.dotfiles
set -g OMF_CONFIG $HOME/.config/omf
source $OMF_PATH/init.fish

# Custom Path
set -gx GOPATH $HOME/.go

set -gx PATH /usr/local/opt/coreutils/libexec/gnubin ~/Code/scripts ~/.composer/vendor/bin ./vendor/bin ./bin $GOPATH/bin /usr/local/sbin $PATH

set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

set -gx EDITOR (which nano)

alias php7 "/usr/local/Cellar/php70/7.0.0-rc.1/bin/php"

function -e fish_preexec _run_fasd
  fasd --proc (fasd --sanitize "$argv") > "/dev/null" 2>&1
end

function z
  cd (fasd -d -e 'printf %s' "$argv")
end

complete -c z --no-files -a (printf "%s " (fasd -ld))
