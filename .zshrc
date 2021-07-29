# Enable zsh profiler #
#######################
# zmodload zsh/zprof

# Path to your oh-my-zsh configuration.
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/curl/bin:/Users/$USER/bin:/Users/rlamas/.oh-my-zsh/bin:/Users/rlamas/go/bin:~/bin/terraform:$PATH"
export ZSH_DISABLE_COMPFIX=false
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
export LDFLAGS="-L/usr/local/opt/curl/lib"
export CPPFLAGS="-I/usr/local/opt/curl/include"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="sonicradish"
ZSH_THEME="powerlevel9k/powerlevel9k"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=15

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# all of our zsh files
typeset -U config_files
config_files=(~/.zsh.d/**/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit -D ~/Users/$USER/.zcompdump

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

unset config_files

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git         \
         battery     \
         extract     \
         osx         \
         golang      \
         rbenv       \
         bgnotify    \
         copydir     \
         copybuffer  \
         copyfile    \
         cp          \
         docker      \
         emoji       \
         github      \
         jira        \
         jsontools   \
         terraform   \
         branch      \
         kubectl     \
         dotenv
)

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

# Enable Rbenv for Rubies!
eval "$(rbenv init -)"
