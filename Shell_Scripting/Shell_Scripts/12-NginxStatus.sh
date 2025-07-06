# Script to check nginx status and start nginx if it is not running
#!/bin/bash
systemctl status nginx --no-pager | grep "Active: active (running)" >>/dev/null
if [ $? -ne 0 ]; then
    systemctl start nginx >>/dev/null
    echo "Nginx is not running. Started Nginx !!!"
else
    echo "Nginx is alredy running on the server and the status is active !!!"
fi
