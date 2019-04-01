# Environment Variables
set -x GOPATH $HOME/.local/share/go
set -x COMPOSER_HOME $HOME/.config/composer
set -x PATH $HOME/code/scripts $HOME/.poetry/bin $GOPATH/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin /usr/local/sbin /usr/local/opt/python3/bin /usr/local/opt/python2/bin /usr/local/opt/ruby/bin $PATH
set -x EDITOR '/usr/local/bin/code'
set -x MANPATH /usr/local/share/man /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin /usr/share/man
set -x FZF_DEFAULT_OPTS '--color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81 --color info:144,prompt:161,spinner:135,pointer:135,marker:118'
set -x BAT_PAGER $HOME/code/scripts/bat_pager
set -x KOPS_STATE_STORE s3://linio-kubernetes
set -x VAULT_ADDR https://vault.linio.com

if type -q yarn
    set -x PATH (yarn global bin) $PATH
end

if test -e /usr/libexec/java_home
    set -x JAVA_HOME /usr/libexec/java_home
else if test -e /usr/lib/jvm/java-8-oracle
    set -x JAVA_HOME /usr/lib/jvm/java-8-oracle
end

# Automatically install Fundle
if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

# bobthefish
set -g theme_display_ruby no
set -g theme_display_k8s_context yes
set -g theme_display_git_master_branch yes

# spacefish
set SPACEFISH_PROMPT_ORDER time user dir host git aws kubecontext exec_time line_sep exit_code char

fundle plugin 'reinaldogranado/pkg-fzf'
fundle plugin 'oh-my-fish/plugin-grc'
fundle plugin 'oh-my-fish/plugin-extract'
#fundle plugin '0rax/fish-bd'
fundle plugin 'oh-my-fish/plugin-composer'
fundle plugin 'fishgretel/pkg-hub'
#fundle plugin 'oh-my-fish/plugin-thefuck'
#fundle plugin 'oh-my-fish/plugin-bang-bang'
#fundle plugin 'tuvistavie/fish-ssh-agent'
#fundle plugin 'ovidner/pipenv'
#fundle plugin 'oh-my-fish/theme-robbyrussell'
#fundle plugin 'oh-my-fish/theme-gnuykeaj'
#fundle plugin 'oh-my-fish/theme-clearance'
#fundle plugin 'nesl247/fish-theme-dracula'
fundle plugin 'oh-my-fish/theme-bobthefish'
#fundle plugin 'MaxMilton/pure'
#fundle plugin 'rafaelrinaldi/pure'
#fundle plugin 'matchai/spacefish'
fundle plugin 'evanlucas/fish-kubectl-completions'
fundle plugin 'oh-my-fish/plugin-aws'

fundle init

# Sets LS back to default with GRC plugin
set grcplugin_ls --indicator-style=classify --color -xh

# Aliases
alias g git
alias gt 'gittower'
alias clip clip.exe
alias lc 'colorls -r'
alias dc docker-compose
alias cat bat

# iTerm2 integration
test -e {$HOME}/.iterm2_shell_integration.fish
and source {$HOME}/.iterm2_shell_integration.fish

# Kubernetes Tools fish completion start
source $HOME/.config/fish/completions/kubernetes-tools.fish

direnv hook fish | source
