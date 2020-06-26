#!/bin/bash


# =====================================================================
# awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | xargs -n1 id | less
# less /etc/shadow | grep username | cut -d: -f2
# deluser --remove-home --backup username
# =====================================================================

# Enable SSH from anywhere secutiy group
# Login as root via "EC2 instance connect"
# Disable SSH from anywhere secutiy group

# ssh-copy-id ec2-3-87-250-49.compute-1.amazonaws.com
# ssh -A aamir@ec2-3-87-250-49.compute-1.amazonaws.com

git clone git@bitbucket.org:akhan3/linux-config-files.git ~/linux-config-files
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone git@github.com:akhan3/.tmux.git ~/.github.akhan3.tmux

cd ~/linux-config-files/dotfiles/home/aamir
ln -s -b -v "$PWD/.bash_aliases"        ~/
ln -s -b -v "$PWD/.bash_completion"     ~/
ln -s -b -v "$PWD/.bashrc"              ~/
ln -s -b -v "$PWD/.gitconfig"           ~/
ln -s -b -v "$PWD/.gitignore_global"    ~/
ln -s -b -v "$PWD/.gitmessage"          ~/
ln -s -b -v "$PWD/.profile"             ~/
ln -s -b -v "$PWD/.vimrc"               ~/
ln -s -b -v "$PWD/.ssh/rc"              ~/.ssh/
cd ~/.github.akhan3.tmux
ln -s -b -v "$PWD/.tmux.conf"  ~/
ln -s -b -v "$PWD/.tmux.conf.local"  ~/

# [log out]
whoami; hostname
cat ~/.bash_history ~/.bash_history_eternal | sponge ~/.bash_history_eternal
sudo apt update && sudo apt dist-upgrade -yq

# [start tmux]
# Ctrl+a Shift+i
# Ctrl+a u
# Ctrl+a r

# RAM: 125
