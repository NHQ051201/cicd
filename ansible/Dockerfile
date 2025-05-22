FROM ubuntu:jammy

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    openssh-client \
    openssh-server \
    ca-certificates && \
    wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | \
    gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu jammy main" > /etc/apt/sources.list.d/ansible.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends ansible && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["tail", "-f", "/dev/null"]