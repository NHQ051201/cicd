#/bin/bash

echo "Starting to install"

echo "--------------------------------------------------------"
echo "Downloading essential thing"
DEFAULT_VERSION="7.49.8"
read -p "Current version is $DEFAULT_VERSION. Do you want to change it? Default(Enter): N (y/N): " response
if [[ "$response" =~ ^[Yy]$ ]]; then
  read -p "Enter the custom version: " LATEST_VERSION
else
  LATEST_VERSION="$DEFAULT_VERSION"
fi

echo "Using JFrog Artifactory version: $LATEST_VERSION"
curl -L "https://releases.jfrog.io/artifactory/bintray-artifactory/org/artifactory/jcr/docker/jfrog-artifactory-jcr/${LATEST_VERSION}/jfrog-artifactory-jcr-${LATEST_VERSION}-compose.tar.gz" -o jfrog-artifactory-compose.tar.gz
latest_dir=$(tar -tf jfrog-artifactory-compose.tar.gz | head -n 1 | cut -d/ -f1)
tar -xvzf jfrog-artifactory-compose.tar.gz
rm -rf jfrog-artifactory-compose.tar.gz

echo "--------------------------------------------------------"
echo "Creating data"
mkdir -p data/grafana data/jenkins data/loki data/prometheus data/promtail data/alertmanager/config
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