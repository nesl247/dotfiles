fundle plugin 'tuvistavie/oh-my-fish-core'
fundle plugin 'gretel/pkg-fzf'
fundle plugin 'oh-my-fish/plugin-grc'
#fundle plugin 'oh-my-fish/theme-robbyrussell'
#fundle plugin 'oh-my-fish/theme-gnuykeaj'
#fundle plugin 'oh-my-fish/theme-clearance'
fundle plugin 'hasanozgan/theme-lambda'
fundle plugin 'tuvistavie/fish-completion-helpers'
fundle plugin 'oh-my-fish/plugin-extract'
fundle plugin '0rax/fish-bd'
fundle plugin 'oh-my-fish/plugin-composer'
fundle plugin 'nesl247/pkg-hub'

fundle init

# Temporary
__fzf_init

# Custom Path
set -x GOPATH $HOME/.go
set -x PATH /usr/local/opt/coreutils/libexec/gnubin ~/Code/scripts $GOPATH/bin $PATH
set -x EDITOR (which vim)
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman /usr/local/share/man /usr/share/man
set -x FZF_DEFAULT_OPTS '--color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81 --color info:144,prompt:161,spinner:135,pointer:135,marker:118'

# Sets LS back to default with GRC plugin
set grcplugin_ls --indicator-style=classify --color -xh

# Aliases
alias xphp "php -dzend_extension=/usr/local/opt/php70-xdebug/xdebug.so"

# Command history searching with ctrl + r
function fish_user_key_bindings
  bind \cr 'fh'
end

# enhancd
set -gx ENHANCD_FILTER fzf
source $HOME/.enhancd/fish/enhancd.fish
alias z cd::cd

# iTerm2 integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
