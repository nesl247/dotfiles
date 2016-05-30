# Custom Path
set -x GOPATH $HOME/.local/share/go
set -x COMPOSER_HOME $HOME/.config/composer
set -x PATH /usr/local/opt/coreutils/libexec/gnubin ~/Code/scripts $GOPATH/bin /usr/local/sbin $PATH
set -x EDITOR (which vim)
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman /usr/local/share/man /usr/share/man
set -x FZF_DEFAULT_OPTS '--color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81 --color info:144,prompt:161,spinner:135,pointer:135,marker:118'

# Automatically install Fundle
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

fundle plugin 'reinaldogranado/pkg-fzf'
fundle plugin 'oh-my-fish/plugin-grc'
#fundle plugin 'oh-my-fish/theme-robbyrussell'
#fundle plugin 'oh-my-fish/theme-gnuykeaj'
#fundle plugin 'oh-my-fish/theme-clearance'
fundle plugin 'nesl247/fish-theme-dracula'
fundle plugin 'oh-my-fish/plugin-extract'
fundle plugin '0rax/fish-bd'
fundle plugin 'oh-my-fish/plugin-composer'
fundle plugin 'nesl247/pkg-hub'
fundle plugin 'oh-my-fish/plugin-thefuck'
fundle plugin 'oh-my-fish/plugin-argu'
fundle plugin 'oh-my-fish/plugin-expand'

fundle init

# Command history searching with ctrl + r
function fish_user_key_bindings
  bind \cr 'fh'

  # Needed for plugin-expand to work
  # Bind word expansion (and command completion) to the Tab key.
  #bind --sets-mode expand \t expand:execute

  # During expansion, bind Backspace to revert the operation.
  #bind --mode expand --sets-mode default --key backspace expand:revert

  # Bind Tab to cycle through the available expansions.
  #bind --mode expand \t expand:choose-next

  # If the user enters any key other than Backspace, exit expand mode and passthrough keys to the default binding.
  #bind --mode expand --sets-mode default '' ''
end

# plugin-expand expansions
expand-word -p '^s/..*/.*$' -e 'echo -n "$history[1]" | sed -e (commandline -t)/g'

# Sets LS back to default with GRC plugin
set grcplugin_ls --indicator-style=classify --color -xh

# Aliases
#alias xphp "php -dzend_extension=/usr/local/opt/php70-xdebug/xdebug.so"
alias g git

# enhancd
set -gx ENHANCD_FILTER fzf
source $HOME/.enhancd/fish/enhancd.fish
alias z cd::cd

# iTerm2 integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# This is too slow so disabling for the moment.
#brew command command-not-found-init > /dev/null; and . (brew command-not-found-init)
