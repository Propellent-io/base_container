FROM ubuntu:20.04

ENV PATH="/opt/bin:${PATH}"

WORKDIR /opt/bin

RUN apt-get update

# wget is used to download tools
# git is used by accurics to get repository information
RUN apt-get install -y ca-certificates

RUN apt-get clean && apt-get autoremove --yes

ADD ca_cert.pem /usr/local/share/ca-certificates/my-cert.crt

RUN chmod 644 /usr/local/share/ca-certificates/my-cert.crt && update-ca-certificates

CMD ["/bin/bash"]
