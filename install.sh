#/bin/bash

echo "Starting to install"

echo "Creating data"
mkdir -p data/grafana data/jenkins data/loki data/prometheus data/promtail
echo "Data has been created"

echo "Copying essential configuration"
cp loki-config.yml data/loki
cp promtail-config.yml data/pronmtail
cp prometheus.yml data/prometheus
echo "Done"

echo "Run docker compose"
docker-compose up -d

echo "All done and ready to use"