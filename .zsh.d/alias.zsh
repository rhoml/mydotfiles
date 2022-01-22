# Alias: compilation of useful aliases
#        Do more with less
alias reload!='. ~/.zshrc'
alias cls='clear'
alias brew!='brew bundle install -v --global'

alias zshconfig='code ~/.zshrc'
alias tmuxconfig='code ~/.tmux'
alias zprofileconfig='code ~/.zprofile'
alias spacemacs='code ~/.spacemacs'

alias -s git="git clone" # No need to type `git clone` again
alias myip4="dig -4 +short @one.one.one.one CH TXT whoami.cloudflare. | sed -e 's,\",,g'"
alias myip6="dig -6 +short @one.one.one.one CH TXT whoami.cloudflare. | sed -e 's,\",,g'"
alias afk="open -a /System/Library/CoreServices/ScreenSaverEngine.app"
alias FlushDNS!="sudo killall -HUP mDNSResponder"
alias pubkey="cat ~/.ssh/id_ed25519.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
