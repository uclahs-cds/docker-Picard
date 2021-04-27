FROM ubuntu:20.04

LABEL maintainer="Aaron Holmes <aholmes@mednet.ucla.edu>"

RUN apt-get update && apt-get install -y --no-install-recommends \
      default-jre \
      wget \
      && rm -rf /var/lib/apt/lists/*

WORKDIR /picard-tools

RUN PICARDJAR_SHA512=bf72718168201217d6981136293ae649bfb1a59cf251a2a613b5c632126a49e2ccd38cd45c845f8d3874b910f90840353c4cb83aee2b2094cd54f18753d7cbb4 \
      && wget https://github.com/broadinstitute/picard/releases/download/2.23.3/picard.jar \
      && echo $PICARDJAR_SHA512 picard.jar | sha512sum --strict -c -
