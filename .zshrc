# ========================
# Theme conf
# ========================

# powerlevel10k:
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="powerlevel10k/powerlevel10k"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# brew
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 
# i use arch btw


COMPLETION_WAITING_DOTS="true"

# plugins
plugins=(git sudo history encode64 copypath zsh-autosuggestions zsh-syntax-highlighting)

# Chỉnh màu gợi ý (autosuggest) cho mờ đi một tí, chuẩn vibe Nord
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4c566a,underline"

source $ZSH/oh-my-zsh.sh

# ========================
# User configuration
# ========================

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# ========================
# alias
# ========================

alias v='nvim'

# moving alias
alias ..='cd ..'         # Lên thư mục cha
alias ...='cd ../..'     # Lên 2 thư mục cha
alias ll='ls -alF'       # Xem danh sách chi tiết (ẩn, thư mục, có dấu /)

alias cl='clear'

# ========================
#     Global env var
# ========================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for java 
export JAVA_HOME=/usr/lib/jvm/jdk-25.0.1-oracle-x64
export PATH=$PATH:$JAVA_HOME/bin

# for python env (pipx)
export PATH="$PATH:$HOME/.local/bin"

#for golang
if command -v go > /dev/null 2>&1; then
  export PATH="$PATH:$(go env GOPATH)/bin"
fi

#for laravel
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# ---- yazi setup -----
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# ----- Zoxide setup -----
eval "$(zoxide init zsh)"

# ----- FZF setup -----
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ----- Neovide ------
 alias neovide='GDK_BACKEND=x11 neovide'

# ---- bun -------
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# starship setup
eval "$(starship init zsh)"
# To customize prompt, run `p10k configure` or edit ~/dotfiles/.p10k.zsh.
# [[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh

# opencode
export PATH=$HOME/.opencode/bin:$PATH

# pyenv setup - not yet
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# since i using pacman / yay to install, this thing no more need
# . "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
