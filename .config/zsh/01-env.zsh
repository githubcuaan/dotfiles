# brew
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# i use arch btw

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

COMPLETION_WAITING_DOTS="true"

export EDITOR='nvim'

# Java
export JAVA_HOME=/usr/lib/jvm/jdk-25.0.1-oracle-x64
export PATH=$PATH:$JAVA_HOME/bin

# pipx
export PATH="$PATH:$HOME/.local/bin"

# Go
if command -v go > /dev/null 2>&1; then
  export PATH="$PATH:$(go env GOPATH)/bin"
fi

# Laravel
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Opencode
export PATH=$HOME/.opencode/bin:$PATH

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# pnpm
export PNPM_HOME="/home/andev/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Local bin
. "$HOME/.local/share/../bin/env"
# . "$HOME/.cargo/env"
