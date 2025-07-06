# Ngrok
#
#
# Terminal Based Programs
# rainfrog = a database management tui
# lazydocker = a docker tui
# posting = a command-line HTTP client similar to Postman
# yazi = a terminal-based file manager
#
# Terminal Based Games
# cataclysm = a roguelike game with complex survival system
# ninvaders = a space invaders clone
# nethack = a dungeon crawling game


bindkey -v
export ZSH="$HOME/.oh-my-zsh"


plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    # auto-notify
    zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# pokemon-colorscripts --no-title -s -r
# pokemon-colorscripts -s -r

eval "$(zoxide init zsh --cmd cd)"

# cargo - rust package manager
export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"


# ffzf - fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Oh my posh
export PATH=$PATH:/home/spider/.local/bin
eval "$(oh-my-posh init zsh --config ~/.oh-my-posh/themes/gaurab_custom_theme.json)"

# Aliases
# alias ls="exa --icons"
alias vim="nvim"
alias chrome="google-chrome"
# alias cat="batcat"
alias python="python3"
# alias cowsay="cowsay -f dragon"
alias t="tmux"
alias phi="ollama run phi"
alias "goanddie"="shutdown now"
alias discord="flatpak run com.discordapp.Discord --enable-features=UseOzonePlatform --ozone-platform=x11"

alias px="pnpm dev"
alias yx="yarn dev"
alias yb="yarn build"


# Git
alias gs="git status"
alias ga="git add ."
alias gl="git log --oneline"
alias gb="git branch"
alias gpull="git pull"
alias gpush="git push"
alias gco="git checkout"


# # VScode - make it faster to load
# alias code="2>/tmp/vscode_output code --disable-gpu --disable-software-rasterizer \'$@\'"
#
#django with debugpy
# alias python-debugpy="python3 -m debugpy --listen 5678 --wait-for-client manage.py runserver --noreload"
alias debugpy="~/.local/share/pipx/venvs/debugpy/bin/python -m debugpy --listen 5678 --wait-for-client manage.py runserver --noreload"
alias py="python3"

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

export EDITOR=/usr/local/bin/nvim

# eval "$(starship init zsh)"
bindkey -v
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/home/spider/.local/lib/npm/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath+=(~/.zsh/completions)


# To enable natural scrolling
# xinput set-prop 12 "libinput Natural Scrolling Enabled" 1

# To disable natural scrolling
# xinput set-prop 12 "libinput Natural Scrolling Enabled" 0
eval "$(~/.local/bin/mise activate zsh)"
eval "$(direnv hook zsh)"
