# My dotfiles for Mac OS X

### I just create a symbolic link to these files in their respective locations

* Local files can be included, just put them in your ~ folder
* .bash\_prompt\_local, sample is in repo
* .bash\_aliases_local

### Files
* bash_profile is the main file bash calls, it then calls the other bash_ files if they exist
* bash_path sets up the path
* bash_prompt sets up the prompt, because my prompt needs to know about the user of the mac, and I have multiple macs with different usernames, I created a local file to store the name in that this file calls
* bash_exports sets up the enviornment variables
* bash_aliases creates aliases - I have different things I want on different computers, so I have this file call a local file