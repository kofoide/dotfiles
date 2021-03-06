#!/bin/bash

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Load the shell dotfiles, and then some:
# * ~/.bash_path can be used to extend `$PATH`.
# * ~/.bash_prompt can be used to build terminal prompt
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_path,bash_prompt,bash_exports,bash_aliases,bash_functions,bash_extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# init z https://github.com/rupa/z
#. ~/z/z.sh

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# http://stackoverflow.com/questions/13804382/how-to-automatically-run-bin-bash-login-automatically-in-the-embeded-termin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#if [ -f ~/.bashrc ]; then
#	source ~/.bashrc
#fi

if [ -f ~/.bash_after_local ]; then
	source ~/.bash_after_local
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
