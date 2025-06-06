# ~/.bashrc for Termux

# Enable color for `ls` and `grep`
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Set a nice prompt with colors
PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\$ '

# Auto-complete settings
shopt -s histappend       # Append to the history file, rather than overwrite it
shopt -s checkwinsize     # Adjust the size of the terminal window
shopt -s autocd           # Automatically change directory without typing 'cd'

# Enable history search with arrow keys
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Set the history file and size
export HISTSIZE=10000      # Number of commands to remember in history
export HISTFILESIZE=20000  # Number of commands to store in the history file

# Customize the history command
export HISTCONTROL=ignoredups:erasedups  # Ignore duplicate commands

# Enable better tab completion for various commands
export COMPLETE_EMACS=1
export COMPLETE_HISTORY=1

# Set the default editor
export EDITOR=nano

# Add some helpful functions

# Reload .bashrc
alias reload='source ~/.bashrc'

# Go up multiple directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Get current weather info using wttr.in
alias weather="curl wttr.in"

# Set up a colorful directory listing
alias dir='ls --color=auto -l'

# Enable battery status check
alias battery='termux-battery-status'

# Python environment setup (adjust this if you have a specific Python version)
export PYTHONSTARTUP=~/.pythonstartup

# Set custom TERM variable to get better support for colors
export TERM=xterm-256color

# If you use `git`, these will make your life easier
alias gs='git status'
alias gl='git log'
alias gd='git diff'

# Enable aliases and functions in scripts
shopt -s expand_aliases

# Custom PATH for local binaries (if you install things like pip or npm globally)
export PATH=$HOME/.local/bin:$PATH

# Optional: Enable the night mode in termux (dark mode automatically)
if [[ "$TERMUX_VERSION" =~ "night" ]]; then
  export TERM=xterm-256color
  alias nightmode="termux-style -b #212121"
fi

# Load the user's custom settings or script (if you have one)
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# Enable Virtual Environment (if using Python)
if [ -d "$HOME/venvs" ]; then
  export WORKON_HOME=$HOME/venvs
  source /usr/local/bin/virtualenvwrapper.sh
fi
