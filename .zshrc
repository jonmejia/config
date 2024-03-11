# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="zhann"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"


zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


alias v='nvim' 
alias z='zed'
alias :q='exit'

alias vimconfig='nvim ~/.config/nvim'
alias tmuxconfig='nvim ~/.tmux.conf'
alias zshconfig='nvim ~/.zshrc'
alias kittyconfig='nvim ~/.config/kitty/kitty.conf'
alias loadzsh='source ~/.zshrc'

#git commands beacuse I'm a genius
alias gp='git pull'
alias gpm='git pull origin main'
alias gc='git checkout'
alias gb+='git checkout -b'
alias gb='git branch'

function code~ {
    local base_path=~/Repositories      
    ls "$base_path"
    echo -n "Enter the repository name: "
    read repo_name

    cd "$base_path/$repo_name" || return 1

    echo -n "Choose an action: [1]nvim [2]dev [3]none :"
    read action

    case $action in
        1) nvim ;;
        2) npm run dev ;;
        3) ls ;;
        *) echo "Invalid choice. Exiting." ;;
    esac
}

function git~ {
  git pull
  echo -n "Which files would you like to commit? "
  read files
  local file_paths=($files)
  [ "${#file_paths[@]}" -eq 0 ] && echo "No files specified. Exiting." && return 1
  git add "${file_paths[@]}"
  echo -n "Enter the commit message: "
  read commit_message
  while true; do
    echo -n "Commit message: '$commit_message'. Do you want to use this message? (y/n): "
    read confirm
    case $confirm in
      [Yy]* )
        git commit -m "$commit_message"
        git push
	echo 'Your commit has been pushed!🚀'
        break;;
      [Nn]* )
        echo -n "Enter a new commit message: "
        read commit_message
        ;;
      * )
        echo "Please enter 'y' or 'n'."
        ;;
    esac
  done
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
