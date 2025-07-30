# A simple CI/CD setup

This can take up to 6 vms to run smoothly

## 1. Requirment

- docker (24.0.7) and can run with normal user
- docker-compose (1.29.2)
- make sure you have sudo permission

## 2. Installation

### To install jenkins

If you want to connect the build agent to jenkins server need to create jenkins user for the build agent

```
./cicd/install_jenkins.sh
```

### To install jfrog

Jfrog require at least 4 cores CPU and 6GB of Ram for the minium. Default version used is 7.49.8 (can be changed while setting)

```
./cicd/install_jfrog.sh
```

To use and push image to local registry if using local domain or IP need to setting the following

```
nano /etc/docker/daemon.json
----------- add below to created file
{ 
  "insecure-registries":["host:port"] 
}
----------- reload docker service and daemon
sudo systemctl daemon-reexec
sudo systemctl restart docker
sudo systemctl restart cri-docker.service
sudo systemctl restart cri-docker.socket
```

### To install monitor tools

The monitoring tools including: grafana, prometheus, promtail and alertmanager.

1. Node exporter

To make Prometheus work, you need to install Node Exporter on nodes (devices) you want to monitor.

Refer to this guide for install and setup: https://prometheus.io/docs/guides/node-exporter/

2. Update correct settings

Change config files to your device IP address and correct information:

- promtail-config.yml:

```
    clients:
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
3. Grafana sample config can be refer in template/grafana

4. Installation

```
./cicd/install_monitor.sh
```

### To install ansible

This installation will write provide a command d-ansible stands for docker exec -i ansible bash -c ""

```
./cicd/install_ansible.sh
```

### To install kubernetes

```
./cicd/install_k8s.sh
```

### To install nginx

```
./cicd/install_nginx.sh
```

## 3. Publish local domain
There are couple ways to publish local domain to access through internet

- Using ngrok refer to this [link](https://ngrok.com/downloads/linux)

- Using localtunnel (being used in this demo) refer to this [link](https://www.npmjs.com/package/localtunnel)

- Jenkins

```
start_domain_jenkins.sh
```

- Jfrog

```
start_domain_jrog.sh
```

- Monitoring tools

```
start_domain_monitor.sh
```

## 4. Uninstallation
```
./uninstall.sh
```
