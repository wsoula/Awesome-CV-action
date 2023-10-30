FROM wsoula/docker-texlive-thin

#sed -i -r 's/([a-z]{2}.)?archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list && \
#sed -i -r 's/security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list && \
RUN \
    echo "===> Update repositories" && \
    apt-get update && \
    echo "===> Install jq and curl" && \
    apt-get install -y curl jq && \
    echo "===> Clean up" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY fonts /usr/local/share/fonts

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

