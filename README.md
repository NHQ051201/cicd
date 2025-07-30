# A simple CI/CD setup

This can take up to 6 vms to run smoothly

## 1. Requirment
- docker (24.0.7) and can run with normal user
- docker-compose (1.29.2)
- make sure you have sudo permission

## 2. Installation

### To install jenkins
```
./cicd/install_jenkins.sh
```

### To install jfrog
Jfrog require at least 4 cores CPU and 6GB of Ram for the minium. Default version used is 7.49.8 (can be changed while setting)
```
./cicd/install_jfrog.sh
```

### To install monitor tools
The monitoring tools including: grafana, prometheus, promtail and alertmanager
To make Prometheus work, you need to install Node Exporter on nodes (devices) you want to monitor.
Refer to this guide for install and setup: https://prometheus.io/docs/guides/node-exporter/
```
./cicd/install_monitor.sh
```

### To install ansible
This installation will write provide a command d-ansible stands for docker exec -i ansible bash -c ""
```
./cicd/install_ansible.sh
```

## 3. Uninstallation
```
./uninstall.sh
```
