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

# Disable Touchpad
# ~/.config/hypr/UserConfigs/Laptops.conf


bindkey -v
export ZSH="$HOME/.oh-my-zsh"

### Added by Zinit's installer
# if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
#     print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
#     command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
#     command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
#         print -P "%F{33} %F{34}Installation successful.%f%b" || \
#         print -P "%F{160} The clone has failed.%f%b"
# fi
#
# source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
# # autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit

# ZSH_THEME="funky"

plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    auto-notify
    zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# pokemon-colorscripts --no-title -s -r
# pokemon-colorscripts -s -r

eval "$(zoxide init zsh --cmd cd)"

# cargo - rust package manager
export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"

. "$HOME/.local/bin/env"


# ffzf - fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Oh my posh
export PATH=$PATH:/home/spider/.local/bin
eval "$(oh-my-posh init zsh --config ~/.oh-my-posh/themes/gaurab_custom_theme.json)"

# Aliases
# alias ls="exa --icons"
alias vim="nvim"
alias chrome="google-chrome"
alias cat="batcat"
alias python="python3"
alias cowsay="cowsay -f dragon"
alias t="tmux"

# VScode - make it faster to load
alias code="2>/tmp/vscode_output code --disable-gpu --disable-software-rasterizer \'$@\'"

#Nepali Date
alias nepali-date="source /home/spider/code/Nepali_date/venv/bin/activate && python3 /home/spider/code/Nepali_date/main.py"

# VLC terminal mode
alias vlc-terminal="vlc -I ncurses /home/spider/Music"

#django with debugpy
alias python-debugpy="python3 -m debugpy --listen 5678 --wait-for-client manage.py runserver --noreload"

# Open zen browser
alias zen="/home/spider/.local/share/AppImage/ZenBrowser.AppImage"

# Keysound
# Git hub page: https://github.com/fgheng/keysound/blob/master/README-en.md
alias keysound="/home/spider/Music/Keysounds/keysound/keysound -j /home/spider/Music/Keysounds/keysound//audio/keysounds/keysound.json -D"
# Stop Keysound
alias keysound-kill="/home/spider/Music/Keysounds/keysound/keysound -k"

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

export EDITOR=/usr/local/bin/nvim

# eval "$(starship init zsh)"
bindkey -v
export PATH=$PATH:$HOME/.local/bin
