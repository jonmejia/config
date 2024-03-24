alias v='nvim' 
alias z='zed'
alias :q='exit'

alias vimconfig='nvim ~/.config/nvim'
alias tmuxconfig='nvim ~/.tmux.conf'
alias zshconfig='nvim ~/.zshrc'
alias kittyconfig='nvim ~/.config/kitty/kitty.conf'
alias loadzsh='source ~/.zshrc'
alias starshipconfig='nvim ~/.config/starship.toml'

#git commands beacuse I'm a genius
alias gp='git pull'
alias gpm='git pull origin main'
alias gc='git checkout'
alias gb+='git checkout -b'
alias gb='git branch'

alias git~='lazygit'

function code~ {
    local base_path=~/Repositories      
    ls "$base_path"
    echo -n "Enter the repository name: "
    read repo_name

    cd "$base_path/$repo_name" || return 1

    echo -n "Choose an action: [1]nvim [2]git [3]dev [4]cd && ls :"
    read action

    case $action in
        1) nvim ;;
        2) lazygit ;;
        3) npm run dev ;;
	4) ls;;
        *) echo "Invalid choice. Exiting." ;;
    esac
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(starship init zsh)"
