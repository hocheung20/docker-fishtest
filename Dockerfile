FROM ubuntu:20.04
MAINTAINER Marcelo Rodrigo <mrodrigow@gmail.com>

ENV concurrency 1
ENV username yourusername
ENV password yourpassword
WORKDIR /
RUN apt-get update && \
    apt-get install -y --no-install-recommends git python build-essential && \
	apt-get purge -y unzip && \
    	rm -rf /var/lib/apt/lists/* && \
	git clone https://github.com/hocheung20/fishtest
CMD python /fishtest/worker/worker.py --concurrency $concurrency $username $password
