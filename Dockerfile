FROM ubuntu:20.04

LABEL maintainer="Aaron Holmes <aholmes@mednet.ucla.edu>"

RUN apt-get update && apt-get install -y --no-install-recommends \
      default-jre \
      wget \
      && rm -rf /var/lib/apt/lists/*

WORKDIR /picard-tools

RUN PICARDJAR_SHA512=eb52e374a965767976d6ea0af00390d10dec9387ffa0b6c03708fe6726b0142938bc06efbc8df1d50c8aecf609cb0496a89bf714c71eaa96f42059b81610a551 \
      && wget https://github.com/broadinstitute/picard/releases/download/2.25.5/picard.jar \
      && echo $PICARDJAR_SHA512 picard.jar | sha512sum --strict -c -
