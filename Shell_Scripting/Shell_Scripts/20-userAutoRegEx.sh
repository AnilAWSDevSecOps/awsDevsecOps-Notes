# Check if user exist and if not create it, generate random password and assign it to the user.
# expire the password and force the user to change it on first login
# Make sure user is in the sudo group
#!/bin/bash
WebHook='https://hooks.slack.com/services/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'
#USER=$1
if [ $# -gt 0 ]; then
    for USER in $@; do
        if [[ $USER =~ ^[a-z][a-z][a-z][a-z][0-9][0-9][0-9][0-9]$ ]]; then
            EXISTING_USER=$(sudo cat /etc/passwd | grep -i -w $USER | cut -d ":" -f 1)
            if [ "${EXISTING_USER}" = "${USER}" ]; then
                echo "User $USER already exists try another username"
            else
                echo "User $USER does not exist, creating user"
                sudo useradd -m -s /bin/bash $USER -d /home/$USER
                sudo usermod -aG sudo $USER
                sudo echo "$USER ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers
                specialChar=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c1)
                PASSWORD="India@$(date +%Y)${specialChar}"
                echo "$USER:$PASSWORD" | sudo chpasswd
                sudo passwd -e $USER
                echo "The password for $USER is $PASSWORD"
                curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"User: $USER has been created with password: $PASSWORD reset password immediately\"}" >>/dev/null

            fi
        else
            echo "Username $USER is invalid, please provide a valid username with 4 alphabets and 4 digits e.g. abcd1234"
        fi
    done
else
    echo "you have given $# arguments, please provide at least one argument"
fi
