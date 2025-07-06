# Check if user exist and if not create it, generate random password and assign it to the user.
# expire the password and force the user to change it on first login
# Make sure user is in the sudo group
#!/bin/bash
USER=$1
EXISTING_USER=$(cat /etc/passwd | grep -i -w $USER | cut -d ":" -f 1)
if [ -z $EXISTING_USER ]; then
    echo "User $USER does not exist, creating user"
    PASSWORD=$(openssl rand -base64 12)
    useradd -m -s /bin/bash $USER
    echo "$USER:$PASSWORD" | chpasswd
    echo "User $USER created with password $PASSWORD"
    chage -d 0 $USER
    usermod -aG sudo $USER
else
    echo "User $USER already exists try another username"
fi
