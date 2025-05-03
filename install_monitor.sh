#/bin/bash

echo "Starting to install"

echo "--------------------------------------------------------"
echo "Creating data path"
mkdir -p data/grafana data/loki data/prometheus data/promtail data/alertmanager/config
echo "Data has been created"

echo "--------------------------------------------------------"
echo "Copying essential configuration"
cp loki-config.yml data/loki
cp promtail-config.yml data/promtail
cp prometheus.yml data/prometheus
cp alertmanager.yml data/alertmanager/config
echo "Done"

echo "--------------------------------------------------------"
echo "Start up containers"
docker-compose up -d grafana loki prometheus promtail alertmanager

echo "--------------------------------------------------------"
echo "All done and ready to use"