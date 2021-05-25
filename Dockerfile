FROM blcdsdockerregistry/bl-base:1.0.0 AS builder

# Use conda to install tools and dependencies into /usr/local
ARG PICARD_VERSION=2.25.5
RUN conda create -qy -p /usr/local \
    -c bioconda \
    picard-slim==${PICARD_VERSION}

# Deploy the target tools into a base image
FROM ubuntu:20.04
COPY --from=builder /usr/local /usr/local

LABEL maintainer="Aaron Holmes <aholmes@mednet.ucla.edu>"
