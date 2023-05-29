eval "$(starship init zsh)"

autoload -Uz compinit 
compinit

# completion with arrow-keys
zstyle ':completion:*' menu select

# start nvm (lazy start)
alias liftnvm=". /usr/share/nvm/init-nvm.sh"
alias rs="redshift -P -O"
alias exercism="~/bin/exercism"
alias sail="./vendor/bin/sail"

# opam configuration (OCaml)
[[ ! -r /home/campos/.opam/opam-init/init.zsh ]] || source /home/campos/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# paths
path+='~/bin'
path+='/home/campos/.local/bin'
export PATH

