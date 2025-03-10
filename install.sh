#/bin/bash

echo "Starting to install"

echo "--------------------------------------------------------"
echo "Creating data"
mkdir -p data/grafana data/jenkins data/loki data/prometheus data/promtail data/alertmanager/config data/nginx
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
cd "$latest_dir"
ls -l
sudo ./config.sh
docker-compose up -d

echo "--------------------------------------------------------"
echo "All done and ready to use"