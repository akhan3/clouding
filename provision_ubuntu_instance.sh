#!/bin/bash

USR="aamir"
logfile=/first_launch.log
pushd /root || exit

(
echo "[$(date --iso=s)] First launch detected"

# Check the user at UID=1000
OLD="$(id -n -u 1000 2> /dev/null)"
if [[ "$OLD" == "$USR" ]]; then
    echo "[$(date --iso=s)] User \"$OLD\" already exists at UID=100. I won't touch a thing..."
    :
else
    if [[ -n "$OLD" ]] ; then
        echo "[$(date --iso=s)] Replacing user \"$OLD\" with \"$USR\" at UID=1000..."
        usermod "$OLD" --login "$USR" --move-home --home /home/"$USR"
        groupmod "$OLD" --new-name "$USR"
    else
        echo "[$(date --iso=s)] Adding new user $USR at UID=1000..."
        adduser "$USR" --disabled-password --gecos "" --uid 1000
    fi
    adduser "$USR" sudo
    # Following is how to generate the salted password hash
    # openssl passwd -6 | sed -e 's/\$/\\\$/g'
    # Paste the salted & hashed password inside the double quotes after escaping dollar sign
    usermod "$USR" -p "\$6\$mad2s9aBKOTmVOeN\$mhoRdRxcr5cFH7V5.BStkXkoOi5oEBSMahPoQxxm4.1z8TARnqlZbTJ9BwNTyY8OCSXoW8hRAw5qZznQVBapE0"
    # Add SSH keys securely
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
fi

echo "[$(date --iso=s)] Updating OS..."
apt-get update -yq
apt-get install -yq sudo git tmux
apt-get install molly-guard tmux git xsel colordiff moreutils curl -yq
apt-get install bat tree ncdu tasksel wajig -yq
apt-get dist-upgrade -yq
echo "[$(date --iso=s)] Updating OS finished!"

) | tee "$logfile"

install -o "$USR" -g "$USR" "$logfile" "/home/\"$USR\""
popd || exit