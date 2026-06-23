# Zoxide
eval "$(zoxide init zsh --cmd cd)"

# FZF
source <(fzf --zsh)

export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Starship prompt
eval "$(starship init zsh)"
# [[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh

# Pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# FNM (Fast Node Manager)
eval "$(fnm env --use-on-cd)"
