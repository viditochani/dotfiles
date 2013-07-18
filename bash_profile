##Environment Setup##
# Z, the new J #
export _Z_CMD=jd
source $HOME/Applications/z.sh

# AWS Config File #
export AWS_CONFIG_FILE=$HOME/.aws

# JAVA HOME setup #
export JAVA_HOME=$(/usr/libexec/java_home)

# Ruby GEM Home #
export GEM_HOME=$HOME/.gem

# PATH settings #
export PATH=$PATH:$HOME/bin:$GEM_HOME/bin:$HOME/Dropbox/Classes/Spring2013/FinalProject/Sireum/apps/platform/scala/bin:$HOME/Applications/sbt/bin:/Volumes/android/WORKING_DIRECTORY/out/host/darwin-x86/bin:$HOME/Dropbox/Coding/map-reduce/emr-ruby:$HOME/Library/Python/2.7/bin

## Set up Prompt ##
[[ -s $HOME/.bash_prompt ]] && source $HOME/.bash_prompt

## Aliases ## 
[[ -s $HOME/.aliases ]] && source $HOME/.aliases

## Functions ##
[[ -s $HOME/.functions ]] && source $HOME/.functions

## Bash AutoComplete ##
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi

## Homebrew autocompletion ##
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

# AWS Autocompletions ##
complete -C aws_completer aws
complete -C aws_completer awso

# set the number of open files to be 1024
# ulimit -S -n 1024
