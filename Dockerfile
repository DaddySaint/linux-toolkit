FROM ubuntu: 22.04

ENV DEBIAN_FRONTEND=nonteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    openssh-client \
    git \
    && rm -rf /var/lib/apt/list/*

RUN pip3 install ansible community.general

WORKDIR /toolkit

COPY . .

RUN chmod +x scripts/*.sh

ENTRYPOINT ["ansible-playbook"]	 
