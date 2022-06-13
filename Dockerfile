FROM mesosphere/aws-cli as PKG

RUN apk --no-cache add openssl \
    && wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
    && mv jq-linux64 /usr/local/bin/jq \
    && chmod +x /usr/local/bin/jq \
    && wget -q -O kubectl https://storage.googleapis.com/kubernetes-release/release/v1.7.0/bin/linux/amd64/kubectl \
    && wget -q -O gomplate https://github.com/hairyhenderson/gomplate/releases/download/v2.4.0/gomplate_linux-amd64-slim \
    && chmod +x kubectl gomplate \
    && mv kubectl gomplate /usr/local/bin

ENTRYPOINT ["/bin/sh","-c"]