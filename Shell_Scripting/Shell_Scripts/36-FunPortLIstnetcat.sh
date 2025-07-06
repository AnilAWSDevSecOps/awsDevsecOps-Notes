# Shell Script to check if the IP port is listening or not using netcat
#!/bin/bash
SERVERS=$@
function is_port_listening {
    for SERVER in $SERVERS; do

        # Checking if the port is listening or not
        timeout 2 nc -zv $SERVER 22 2>&1 | grep succeeded >/dev/null

        # Checking the exit status of the previous command
        if [ $? -eq 0 ]; then
            echo "$SERVER is listening on port 22"
        else
            echo "$SERVER is not listening  on port 22"
        fi
    done
}

function main {

    # Checking if the user has provided the server IP
    if [ $# -eq 0 ]; then
        echo "Please provide the server IP to check if it is listening or not"
        exit 1
    else
        echo "Checking if the given servers are listening or not"
        is_port_listening
    fi
}

# Calling the main function
main $@
