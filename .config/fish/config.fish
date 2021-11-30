# Environment Variables
set -x GOPATH $HOME/go
set -x COMPOSER_HOME $HOME/.config/composer
set -x EDITOR "idea -w -e"
set -x MANPATH /usr/local/share/man /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin /usr/share/man
set -x FZF_DEFAULT_OPTS '--color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81 --color info:144,prompt:161,spinner:135,pointer:135,marker:118'
set -x BAT_PAGER $HOME/code/nesl247/scripts/bat_pager
set -x OP_PROJECT_DIRS $HOME/code $HOME/code/linio $HOME/code/nesl247 $HOME/code/satws
set -x BAT_THEME Dracula
set -x COMPOSE_DOCKER_CLI_BUILD 1
set -x PULUMI_K8S_ENABLE_DRY_RUN 1

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.krew/bin
fish_add_path /usr/local/opt/ruby/bin
fish_add_path /usr/local/lib/ruby/gems/2.7.0/bin
fish_add_path /usr/local/lib/ruby/gems/3.0.0/bin
fish_add_path $GOPATH/bin
fish_add_path /usr/local/opt/python/libexec/bin
fish_add_path /usr/local/opt/findutils/libexec/gnubin
fish_add_path /usr/local/opt/coreutils/libexec/gnubin
fish_add_path /usr/local/opt/gnu-sed/libexec/gnubin
#fish_add_path /usr/local/opt/curl-openssl/bin
fish_add_path /usr/local/opt/make/libexec/gnubin
fish_add_path $HOME/.poetry/bin
fish_add_path $HOME/code/nesl247/scripts

set -g -x "CLOUDSDK_PYTHON" "/usr/local/opt/python@3.8/libexec/bin/python"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"

if type -q yarn
    fish_add_path (yarn global bin)
end

if test -e /usr/libexec/java_home
    set -x JAVA_HOME (/usr/libexec/java_home)
else if test -e /usr/lib/jvm/java-8-oracle
    set -x JAVA_HOME /usr/lib/jvm/java-8-oracle
end

# Automatically install Fundle
if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin 'reinaldogranado/pkg-fzf'
fundle plugin 'oh-my-fish/plugin-grc'
fundle plugin 'oh-my-fish/plugin-extract'
fundle plugin 'oh-my-fish/plugin-composer'
fundle plugin 'oh-my-fish/plugin-aws'
#fundle plugin 'jorgebucaran/fishtape'
fundle plugin 'fishpkg/fish-humanize-duration'
fundle plugin 'franciscolourenco/done'

fundle init

# Sets LS back to default with GRC plugin
set grcplugin_ls --indicator-style=classify --color -xh

# Aliases
alias g git
alias gt 'gittower'
alias lc 'colorls --dark'
alias cat bat

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/harrison/google-cloud-sdk/path.fish.inc' ]; . '/Users/harrison/google-cloud-sdk/path.fish.inc'; end

_kn init --shell fish | source

starship init fish | source
