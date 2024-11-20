# Environment Variables
set -x COMPOSER_HOME $HOME/.config/composer
set -x EDITOR "idea -w -e"
set -x MANPATH /usr/local/share/man /opt/homebrew/share/man /opt/homebrew/opt/coreutils/libexec/gnubin /opt/homebrew/opt/findutils/libexec/gnubin /usr/share/man
set -x BAT_PAGER $HOME/code/nesl247/scripts/bat_pager
set -x JP_PROJECT_DIRS $HOME/code $HOME/code/linio $HOME/code/nesl247 $HOME/code/syntage
#set -x BAT_THEME Dracula
set -x COMPOSE_DOCKER_CLI_BUILD 1
set -Ua fish_features ampersand-nobg-in-token qmark-noglob

fish_add_path $HOME/.orbstack/bin
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.krew/bin
fish_add_path /opt/homebrew/opt/ruby/bin
fish_add_path /opt/homebrew/opt/findutils/libexec/gnubin
fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin
fish_add_path /opt/homebrew/opt/gnu-sed/libexec/gnubin
fish_add_path /opt/homebrew/opt/make/libexec/gnubin
fish_add_path $HOME/code/nesl247/scripts

# Automatically install Fundle
if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin 'oh-my-fish/plugin-grc'
fundle plugin 'oh-my-fish/plugin-extract'
fundle plugin 'oh-my-fish/plugin-composer'
#fundle plugin 'oh-my-fish/plugin-aws'
#fundle plugin 'jorgebucaran/fishtape'
fundle plugin 'fishpkg/fish-humanize-duration'
fundle plugin 'franciscolourenco/done'

fundle init

# Sets LS back to default with GRC plugin
set grcplugin_ls --color -xh

# Aliases
alias g git
alias gt 'gittower'
alias cat bat
alias less bat
alias dce 'docker compose exec'

# iTerm2 integration
source /Users/alexander/.iterm2_shell_integration.fish

# Kubernetes Tools fish completion start
#source $HOME/.config/fish/completions/kubernetes-tools.fish

#set -gx ATUIN_NOBIND "true"
atuin init fish | source

# bind to ctrl-r in normal and insert mode, add any other bindings you want here too
#bind \cr _atuin_search
#bind -M insert \cr _atuin_search

direnv hook fish | source

starship init fish | source

source /Users/alexander/.config/op/plugins.sh

zoxide init fish | source

thefuck --alias | source

# Created by `pipx` on 2024-06-24 16:51:32
set PATH $PATH /Users/alexander/.local/bin
