# A simple CI/CD setup

This can take up to 6 vms to run smoothly

## 1. Requirment
- docker (24.0.7) and can run with normal user
- docker-compose (1.29.2)
- make sure you have sudo permission

## 2. Installation
- Change config files to your device IP address and correct information:
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
  - alertmanager
    ```
    receivers:
      - name: 'mail'
        email_configs:
          - smarthost: 'smtp.gmail.com:465'
            auth_username: 'your_mail@gmail.com'
            auth_password: ""
            from: 'your_mail@gmail.com'
            to: 'some_mail@gmail.com'
    ```
- Install

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
```
./cicd/install_monitor.sh
```

### To install ansible
This installation will write provide a command d-ansible stands for docker exec -i ansible bash -c ""
```
./cicd/install_ansible.sh
```

### To install 
- To make Prometheus work, you need to install Node Exporter on nodes (devices) you want to monitor.
- Refer to this guide for install and setup: https://prometheus.io/docs/guides/node-exporter/

## 3. Uninstallation
```
./uninstall.sh
```
