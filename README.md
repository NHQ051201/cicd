# A simple CI/CD setup demo

## 1. Requirment
- docker (24.0.7) and can run with normal user
- docker-compose (1.29.2)
- make sure you have sudo permission

## 2. Installation
- Change config files to your device IP address:
  - promtail-config.yml:
    ```
    clients:
      - url: http://loki:3100/loki/api/v1/push
    ```
  - loki-config.yml:
    ```
    alertmanager_url: http://localhost:9093
    ```
  - prometheus.yml:
    ```
    - job_name: "host"

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ["IP:PORT"]
    ```
- Install
```
cd cicd
./install.sh
```
- To make Prometheus work, you need to install Node Exporter on nodes (devices) you want to monitor.
- Refer to this guide for install and setup: https://prometheus.io/docs/guides/node-exporter/

## 3. Uninstallation
```
./uninstall.sh
```
