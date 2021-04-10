FROM quay.io/evryfs/base-ubuntu:focal-20210401
LABEL maintainer "fsdevops@evry.com"
RUN apt-get update && \
	apt-get --no-install-recommends -y install jq && \
	apt-get -y clean && \
	rm -rf /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY addmembers.sh /
ENTRYPOINT ["/addmembers.sh"]
