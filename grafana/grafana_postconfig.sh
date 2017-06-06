#!/bin/bash

addDatastore() {
    echo "Set Prometheus as default datasource.."
    curl -s -H "Content-Type: application/json" -u admin:${GF_SECURITY_ADMIN_PASSWORD} \
       -X POST http://localhost:3000/api/datasources -d \
       '{"name":"Prometheus","type":"prometheus","url":"http://prometheus:9090/","access":"proxy","basicAuth":false,"isDefault":true}'
    echo "    Prometheus Datastore added"
}

main() {
    ./run.sh "${@}" &
    for i in {0..60}
        do
            if [[ $(netstat -lpn | grep 3000) ]]; then
                echo "Grafana is running..."
                addDatastore
                break
            else
                echo "Waiting for Grafana to start.."
            fi
            sleep 1
        done
    
    pkill grafana-server
    exec ./run.sh "${@}"
}

main "$@"
