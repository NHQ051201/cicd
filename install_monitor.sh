#/bin/bash

set -e

echo "Starting to install"

echo "--------------------------------------------------------"
echo "Creating data path"
mkdir -p data/grafana data/loki data/prometheus data/promtail data/alertmanager/config
echo "Data has been created"

echo "--------------------------------------------------------"
echo "Copying essential configuration"
cp template/loki/loki-config.yml data/loki
cp template/promtail/promtail-config.yml data/promtail
cp template/prometheus/prometheus.yml data/prometheus
cp template/alertmanager/alertmanager.yml data/alertmanager/config
echo "Done"

echo "--------------------------------------------------------"
echo "Start up containers"
docker-compose up -d grafana loki prometheus promtail alertmanager

echo "--------------------------------------------------------"
echo "All done and ready to use"