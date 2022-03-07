# Environment Variables
set -x GOPATH $HOME/go
set -x COMPOSER_HOME $HOME/.config/composer
set -x EDITOR "idea -w -e"
set -x MANPATH /usr/local/share/man /opt/homebrew/share/man /opt/homebrew/opt/coreutils/libexec/gnubin /opt/homebrew/opt/findutils/libexec/gnubin /usr/share/man
#set -x FZF_DEFAULT_OPTS '--color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81 --color info:144,prompt:161,spinner:135,pointer:135,marker:118'
set -x BAT_PAGER $HOME/code/nesl247/scripts/bat_pager
set -x OP_PROJECT_DIRS $HOME/code $HOME/code/linio $HOME/code/nesl247 $HOME/code/satws
set -x BAT_THEME Dracula
set -x COMPOSE_DOCKER_CLI_BUILD 1
set -x PULUMI_K8S_ENABLE_DRY_RUN 1
set -x MCFLY_FUZZY 2
set -x MCFLY_RESULTS 50
set -x MCFLY_INTERFACE_VIEW BOTTOM

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.krew/bin
fish_add_path /opt/homebrew/opt/ruby/bin
fish_add_path /opt/homebrew/lib/ruby/gems/2.7.0/bin
fish_add_path /opt/homebrew/lib/ruby/gems/3.0.0/bin
fish_add_path $GOPATH/bin
fish_add_path /opt/homebrew/opt/python/libexec/bin
fish_add_path /opt/homebrew/opt/findutils/libexec/gnubin
fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin
fish_add_path /opt/homebrew/opt/gnu-sed/libexec/gnubin
#fish_add_path /opt/homebrew/opt/curl-openssl/bin
fish_add_path /opt/homebrew/opt/make/libexec/gnubin
fish_add_path $HOME/code/nesl247/scripts

source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"

if test -e /usr/libexec/java_home
    set -x JAVA_HOME (/usr/libexec/java_home)
else if test -e /usr/lib/jvm/java-8-oracle
    set -x JAVA_HOME /usr/lib/jvm/java-8-oracle
end

# Automatically install Fundle
if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin 'oh-my-fish/plugin-grc'
fundle plugin 'oh-my-fish/plugin-extract'
fundle plugin 'oh-my-fish/plugin-composer'
fundle plugin 'oh-my-fish/plugin-aws'
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

# iTerm2 integration
if test -e {$HOME}/.iterm2_shell_integration.fish
    source {$HOME}/.iterm2_shell_integration.fish
    function iterm2_print_user_vars
        set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
        iterm2_set_user_var gitBranch "$git_branch"
    end
end

# Kubernetes Tools fish completion start
source $HOME/.config/fish/completions/kubernetes-tools.fish

direnv hook fish | source

_kn init --shell fish | source

mcfly init fish | source

starship init fish | source
