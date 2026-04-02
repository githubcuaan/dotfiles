# zmodload zsh/zprof

# ========================
# Theme conf
# ========================


# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# brew
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 
# i use arch btw


COMPLETION_WAITING_DOTS="true"

# plugins
plugins=(git sudo history encode64 copypath zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ========================
# User configuration
# ========================

# --- Vi mode ---
bindkey -v
export KEYTIMEOUT=15
bindkey -M viins 'jk' vi-cmd-mode

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# ========================
# alias
# ========================

# --- ALIAS CHO EZA (Thay thế ls) ---
# ls thường: hiện icon, gom folder lên đầu

alias ls='eza --icons --group-directories-first -1'
# ll: hiện list chi tiết, có quyền, size, ngày tháng
alias ll='eza -al --icons --group-directories-first --time-style=long-iso'

# tree: hiện dạng cây thư mục (siêu tiện)
alias tree='eza --tree --icons'

alias v='nvim'

# moving alias
alias ..='cd ..'         # Lên thư mục cha
alias ...='cd ../..'     # Lên 2 thư mục cha

# ==================
# function
# ==================

# Hàm biên dịch CPP, chạy và tự xoá file thực thi

gocr() {
    # 1. Kiểm tra đầu vào
    if [ -z "$1" ]; then
        echo " You need to add .cpp argm (ex: gocr ?.cpp)."
        return 1
    fi

    # 2. Định nghĩa tên file output (lấy theo file đầu tiên)
    local out="${1%.*}"

    # 3. Biên dịch TẤT CẢ các file truyền vào ($@ thay vì $1)
    echo "󰄵  Compiling..."
    if g++ -Wall -O2 "$@" -o "$out"; then
        echo "󰐊  Running..."
        echo -e "--------------------------\n"
        ./"$out"
        echo -e "\n"
        echo -e "--------------------------\n"
    else
        echo "  Error when compiling."
    fi

    # 4. LUÔN LUÔN dọn dẹp sau khi xong việc
    if [ -f "$out" ]; then
        rm "$out"
    fi
}

# --- Cursor config ---
# 1. Đổi cursor khi chuyển qua lại giữa Insert và Normal
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]]; then
        echo -ne '\e[1 q' # Block
    else
        echo -ne '\e[5 q' # Line
    fi
}
zle -N zle-keymap-select

# 2. Bắt buộc về dạng Line khi vừa mở prompt mới (Fix lỗi Neovim)
function zle-line-init {
    zle-keymap-select # Tự động gọi lại hàm trên để check mode cho chắc cú
}
zle -N zle-line-init


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
eval "$(zoxide init zsh --cmd cd)"

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
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"



. "$HOME/.local/share/../bin/env"
# . "$HOME/.cargo/env"

#======= pnpm ========
export PNPM_HOME="/home/andev/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# zprof
# zprof
