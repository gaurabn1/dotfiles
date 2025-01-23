bindkey -v
export ZSH="$HOME/.oh-my-zsh"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
# autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# ZSH_THEME="funky"

# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    auto-notify
)

source $ZSH/oh-my-zsh.sh


# pokemon-colorscripts --no-title -s -r
pokemon-colorscripts -s -r

# rainfrog = a database management tui
# lazydocker = a docker tui
# posting = a command-line HTTP client similar to Postman
# yazi = a terminal-based file manager

eval "$(zoxide init zsh --cmd cd)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi



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
alias ls="exa --icons"
alias vim="nvim"
alias chrome="google-chrome"


# zsh-vi-mode Configuration
zinit light "jeffreytse/zsh-vi-mode"
#
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL) VIMODE="N" ;;
    $ZVM_MODE_INSERT) VIMODE="I" ;;
    $ZVM_MODE_VISUAL) VIMODE="V" ;;
    $ZVM_MODE_VISUAL_LINE) VIMODE="L" ;;
    $ZVM_MODE_REPLACE) VIMODE="R" ;;
  esac
  PS1="$VIMODE %~ -> "
  VIMODE_SEGMENT="%K{white}%F{black} $VIMODE %f%k"
  # p10k display -v left "${VIMODE_SEGMENT}"
}
# eval "$(starship init zsh)"
bindkey -v
