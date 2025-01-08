#/bin/bash

echo "Starting to install"

echo "--------------------------------------------------------"
echo "Creating data"
mkdir -p data/grafana data/jenkins data/loki data/prometheus data/promtail data/jfrog/artifactory data/alertmanager/config
sudo chown -R 1030 ./data/jfrog/
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
docker-compose up -d

echo "--------------------------------------------------------"
echo "All done and ready to use"