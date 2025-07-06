# Shell Script to check if the port is listening or not
#!/bin/bash
PORTS=$@
function is_port_listening {
    for PORT in $PORTS; do
        # Checking if the port is listening or not
        netstat -tuln | grep -q $PORT
        if [ $? -eq 0 ]; then
            echo "$PORT is listening"
        else
            echo "$PORT is not listening"
        fi
    done
}

function main {
    if [ $# -eq 0 ]; then
        echo "Please provide the ports to check if it is listening or not"
        exit 1
    else
        echo "Checking if the given ports are listening or not"
        is_port_listening
    fi
}
main $@
# Run the script with the ports to check if it is listening or not
# $ bash 35-FunPortlistening.sh 22 80 443 3306 8080 27017 27018 27019
