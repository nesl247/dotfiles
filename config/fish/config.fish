# Custom Path
set -x GOPATH $HOME/.local/share/go
set -x COMPOSER_HOME $HOME/.config/composer
set -x PATH $GOPATH/bin /usr/local/sbin (yarn global bin) $PATH
set -x EDITOR (which vim)
set -x MANPATH /usr/local/share/man /usr/share/man
set -x FZF_DEFAULT_OPTS '--color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81 --color info:144,prompt:161,spinner:135,pointer:135,marker:118'

if test -d /mnt/c/Windows/System32
  set -x PATH /mnt/c/Windows/System32 $PATH
end

if test -d $HOME/code/scripts
  set -x PATH $HOME/code/scripts $PATH
else if test -d $HOME/Code/scripts
  set -x PATH $HOME/Code/scripts $PATH
end

if test -d /usr/local/opt/coreutils/libexec/gnubin
  set -x MANPATH /usr/local/opt/coreutils/libexec/gnubin $MANPATH
  set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
end

if test -e /usr/libexec/java_home
  set -x JAVA_HOME (/usr/libexec/java_home)
else if test -e /usr/lib/jvm/java-8-oracle
  set -x JAVA_HOME /usr/lib/jvm/java-8-oracle
end

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
fundle plugin 'oh-my-fish/plugin-bang-bang'
#fundle plugin 'tuvistavie/fish-ssh-agent'

fundle init

# Command history searching with ctrl + r
function fish_user_key_bindings
  bind \cr 'fh'
end

# Sets LS back to default with GRC plugin
set grcplugin_ls --indicator-style=classify --color -xh

# Aliases
alias g git

# enhancd
if test -e $HOME/.enhancd/fish/enhancd.fish
  set -gx ENHANCD_FILTER fzf
  source $HOME/.enhancd/fish/enhancd.fish
  alias z cd::cd
end

# iTerm2 integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# This is too slow so disabling for the moment.
#brew command command-not-found-init > /dev/null; and . (brew command-not-found-init)

/usr/bin/keychain $HOME/.ssh/id_rsa
test -e $HOME/.keychain ; and source $HOME/.keychain/*-fish
