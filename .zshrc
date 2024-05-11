##################################################
################   基本路径 设置       #############
##################################################









# 设置基本路径
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Java路径
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_331.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH:.
export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.

# MySQL路径
export PATH=$PATH:/usr/local/mysql/bin

# Go路径
export GOROOT=/Users/zephyr/go1.22/go1.22.2 
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOROOT/
export GO111MODULE=auto

# CMake路径
export PATH=/Applications/CMake.app/Contents/bin:$PATH

# npm路径
export PATH=~/.npm-global/bin:$PATH

# Maven路径
export M2_HOME=/Library/apache-maven-3.8.6
export PATH=$PATH:$M2_HOME/bin

# Poetry路径
export PATH=/Users/zephyr/.local/bin:$PATH

# Conda路径
export PATH=/Users/zephyr/anaconda3/bin:$PATH

# Mojo路径
export MODULAR_HOME=/Users/zephyr/.modular
export PATH=/Users/zephyr/.modular/pkg/packages.modular.com_mojo/bin:$PATH






##################################################
################   conda 初始化       #############
##################################################




# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/zephyr/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/zephyr/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/zephyr/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/zephyr/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<








##################################################
################   ZSH 设置          #############
##################################################








# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# 配置zsh 当前使用的主题
ZSH_THEME="powerlevel9k/powerlevel9k"
# P9k 使用的模式
POWERLEVEL9K_MODE='nerdfont-complete'
# 显示在左边的提示元素（分段位于括号中并以空格隔开）
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda virtualenv pyenv dir dir_writable vcs)
# 显示在右边的提示元素（分段）
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator load ram time)
# 左侧提示符是否显示两行（光标显示在下一行）
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
















##################################################
################   其他 设置          #############
##################################################










# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# compress relatived
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s unzip='unzip'
alias -s bz2='tar -xjvf'
alias -s vi='vim'

alias mate="open -a 'TextMate'"
alias crm="open -a 'Google Chrome'"
alias webstorm="open -a 'WebStorm'"
alias idea="open -a 'IntelliJ IDEA'"
alias markdown="open -a 'Typora'"
alias code="open -a 'Visual Studio Code'"

alias -s php=mate
alias -s rb=mate
alias -s xml=mate
alias -s txt=mate
alias -s hbs=mate
alias -s html=mate
alias -s md=markdown
alias -s py=vim
alias -s java=vim
alias -s c=vim


# git relatived
alias gpom='git push -u origin master'
alias grao='git remote add origin'

# others
alias his='history'
alias la='ls -a'
alias ll='ls -alh'

# proxy
# alias proxy='export all_proxy=socks5://127.0.0.1:1080'
# alias unproxy='unset all_proxy'

export NOTION_PAGE_ID=d1c6284e4fa6467984ed701f4e0552bd

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/.nvm/nvm.sh
nvm use 21  > /dev/null 2>&1
alias t2='tree -L 2'
alias t3='tree -L 3'
alias t='tree -L 1'
alias pv='python -m venv .venv'
export JUPYTER_PLATFORM_DIRS=1



# 快捷键
bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word 
