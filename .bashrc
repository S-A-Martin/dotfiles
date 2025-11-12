bind 'set bell-style none'
eval "$(fzf --bash)"   
alias rg='rg --path-separator=// --vimgrep -i'
bind 'set bell-style none'

source /c/Program\ Files/Git/etc/profile.d/git-prompt.sh

# eval "$(fzf --bash)"

watch () {
  interval=2
  if [ "$1" = "-n" ]; then
    if [[ "$2" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
      interval="$2"
      shift 2
    else
      echo "Error: -n requires a valid number of seconds"
      exit 1
    fi
  fi  
  ARGS="${@}"
  clear;
  while(true); do
    OUTPUT=`$ARGS`
    clear
    echo -e "Every ${interval}s: $ARGS | $(date)"
    echo ""
    echo -e "${OUTPUT[@]}"
    sleep $interval 
  done
}

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH=/c/Users/smartin/.opencode/bin:$PATH

export OPENCODE_DISABLE_PRUNE
export OPENCODE_DISABLE_AUTOCOMPACT
