FROM ubuntu:20.04

LABEL maintainer="Aaron Holmes <aholmes@mednet.ucla.edu>"

RUN apt-get update && apt-get install -y --no-install-recommends \
      default-jre \
      wget \
      && rm -rf /var/lib/apt/lists/*

WORKDIR /picard-tools

RUN wget https://github.com/broadinstitute/picard/releases/download/2.23.3/picard.jar
