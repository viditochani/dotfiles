# PATH settings #
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH:$GEM_HOME/bin:/Volumes/android/WORKING_DIRECTORY/out/host/darwin-x86/bin:$HOME/Dropbox/Coding/map-reduce/emr-ruby:$HOME/Library/Python/2.7/bin:/usr/local/texlive/2013/bin/x86_64-darwin
export PATH=${PATH}:~/Applications/adt/sdk/tools
export PATH=${PATH}:~/Applications/adt/sdk/platform-tools

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# OS dependent sourcing
if [ "$(uname)" == "Darwin" ]; then
  source ~/.osx;
fi;

## Bash autocomplete
if type brew > /dev/null 2>&1 && [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  source $(brew --prefix)/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

## Homebrew autocompletion ##
if type brew > /dev/null 2>&1; then
  source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
fi;

# set the number of open files to be 1024
# ulimit -S -n 1024

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh sshrc;
