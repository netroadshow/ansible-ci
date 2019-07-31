FROM python:3.7-slim

ADD install/ /tmp/install/

RUN PACKER_VERSION=1.4.2 && TERRAFORM_VERSION=0.11.14 && \
    apt-get update && apt-get install --no-install-recommends -yy $(cat /tmp/install/apt.txt) && apt-get -yy clean && \
    curl -sS https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip > packer.zip && \
    unzip packer.zip -d /bin && \
    rm -f packer.zip && \
    curl -sS https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform.zip && \
    unzip terraform.zip -d /bin && \
    rm -f terraform.zip && \
    curl -sS https://github.com/mikefarah/yq/releases/download/2.4.0/yq_linux_amd64 -L > /bin/yq && \
    chmod +x /bin/yq && \
    pip install -r /tmp/install/requirements.txt && \
    rm -rf /var/lib/apt/lists/* && \
    rm -r /root/.cache && \
    mkdir /work && \
    useradd -d /work -u 1000 -s /usr/bin/fish automation && \
    chown automation:automation /work && \
    ln -s /usr/local/bin/python /usr/bin/python && \
    rm -rf /tmp/install/

#Setup user information for container
USER automation
ENV USER=automation

#Set defaults for working directory, entrypoint, and command
WORKDIR /work
ENTRYPOINT []
CMD ["/usr/bin/fish"]
