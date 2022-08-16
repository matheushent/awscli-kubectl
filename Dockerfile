FROM alpine:3.16.2

VOLUME /root/.aws
VOLUME /project
WORKDIR /project

RUN apk --no-cache -v --update add openssl curl groff less mailcap

RUN curl -sL -o awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip \
    && unzip awscliv2.zip \
    && ./aws/install

RUN curl -sL -o jq-linux64 https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
    && mv jq-linux64 /usr/local/bin/jq \
    && chmod +x /usr/local/bin/jq

RUN curl -sL -o kubectl https://storage.googleapis.com/kubernetes-release/release/v1.23.1/bin/linux/amd64/kubectl \
    && curl -sL -o gomplate https://github.com/hairyhenderson/gomplate/releases/download/v2.4.0/gomplate_linux-amd64-slim \
    && chmod +x kubectl gomplate \
    && mv kubectl gomplate /usr/local/bin

ENTRYPOINT ["/bin/sh","-c"]