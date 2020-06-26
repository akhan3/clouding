#!/bin/bash

USR="aamir"
logfile=/root/launch.log

cd /root || exit

(
echo "[$(date --iso=s)] First launch detected"

OLD="$(id -n -u 1000 2> /dev/null)"
if [[ -n "$OLD" ]] ; then
    echo "Found user \"$OLD\" with ID=1000"
    userdel -r "$OLD"
    groupdel "$OLD"
fi

echo "[$(date --iso=s)] Add new user $USR..."
adduser "$USR" --disabled-password --gecos "" --uid 1000
    # Following is how to generate the password hash
    # openssl passwd -6 | sed -e 's/\$/\\\$/g'
    # Paste the salted & hashed password inside the double quotes after escaping dollar sign
usermod "$USR" -p "\$6\$mad2s9aBKOTmVOeN\$mhoRdRxcr5cFH7V5.BStkXkoOi5oEBSMahPoQxxm4.1z8TARnqlZbTJ9BwNTyY8OCSXoW8hRAw5qZznQVBapE0"
adduser "$USR" sudo

authfile=/home/"$USR"/.ssh/authorized_keys
if [[ ! -f "$authfile" ]]; then
    directory="$(dirname "$authfile")"
    su aamir -c "mkdir -p \"$directory\""
    chmod 0700 "$directory"
    install -m 0600 -o "$USR" -g "$USR" /dev/null "$authfile"
fi
echo "
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGEHqJmGRD2IwHdNbzAcqv0dpefc/0aJIpTa8jSQMJCM aamir_thinkpad_1569257096
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDHVlHSmjT6YmYlJ/A19vqzDgM1/TS4+6ulEoksgAIXN aamir@macbook_1553227072
" | awk '{$1=$1; print}' | grep . >> "$authfile"

echo "[$(date --iso=s)] Updating OS..."
apt-get update -yq
apt-get install -yq sudo git tmux
apt-get install molly-guard tmux git xsel colordiff moreutils curl -yq
apt-get install bat tree ncdu tasksel wajig -yq
apt-get dist-upgrade -yq
echo "[$(date --iso=s)] Updating OS finished!"

) | tee "$logfile"

install -o "$USR" -g "$USR" "$logfile" /home/"$USR"


# =====================================================================

# awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | xargs -n1 id | less
# less /etc/shadow | grep username | cut -d: -f2
# deluser --remove-home --backup username

# =====================================================================


# # Enable SSH from anywhere secutiy group
# # Login as root via "EC2 instance connect"
# # Disable SSH from anywhere secutiy group

# # ssh-copy-id ec2-3-87-250-49.compute-1.amazonaws.com
# # ssh -A aamir@ec2-3-87-250-49.compute-1.amazonaws.com

# git clone git@bitbucket.org:akhan3/linux-config-files.git ~/linux-config-files
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# git clone git@github.com:akhan3/.tmux.git ~/.github.akhan3.tmux

# cd ~/linux-config-files/dotfiles/home/aamir
# ln -s -b -v "$PWD/.bash_aliases"        ~/
# ln -s -b -v "$PWD/.bash_completion"     ~/
# ln -s -b -v "$PWD/.bashrc"              ~/
# ln -s -b -v "$PWD/.gitconfig"           ~/
# ln -s -b -v "$PWD/.gitignore_global"    ~/
# ln -s -b -v "$PWD/.gitmessage"          ~/
# ln -s -b -v "$PWD/.profile"             ~/
# ln -s -b -v "$PWD/.vimrc"               ~/
# ln -s -b -v "$PWD/.ssh/rc"              ~/.ssh/
# cd ~/.github.akhan3.tmux
# ln -s -b -v "$PWD/.tmux.conf"  ~/
# ln -s -b -v "$PWD/.tmux.conf.local"  ~/

# # [log out]
# whoami; hostname
# cat ~/.bash_history ~/.bash_history_eternal | sponge ~/.bash_history_eternal
# sudo apt update && sudo apt dist-upgrade -yq

# # [start tmux]
# # Ctrl+a Shift+i
# # Ctrl+a u
# # Ctrl+a r

# # RAM: 125
