## J2 setup ##
#export JPY=/Users/Vidit/Applications/j2/j.py
#source /Users/Vidit/Applications/j2/j.sh

# Z, the new J #
export _Z_CMD=jd
source /Users/Vidit/Applications/z.sh

# AWS Config File #
export AWS_CONFIG_FILE=/Users/Vidit/.aws

# JAVA HOME setup #
export JAVA_HOME=$(/usr/libexec/java_home)

## Ruby GEM Home ##
export GEM_HOME=/Users/Vidit/.gem

## PATH settings ##
export PATH=$PATH:/Users/Vidit/bin:$GEM_HOME/bin:/Users/Vidit/Dropbox/Classes/Spring2013/FinalProject/Sireum/apps/platform/scala/bin:/Users/Vidit/Applications/sbt/bin:/Volumes/android/WORKING_DIRECTORY/out/host/darwin-x86/bin:/Users/Vidit/Dropbox/Coding/map-reduce/emr-ruby:/Users/Vidit/Library/Python/2.7/bin

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
