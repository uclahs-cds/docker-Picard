FROM blcdsdockerregistry/bl-base:1.1.0 AS builder

# Use mamba to install tools and dependencies into /usr/local
ARG PICARD_VERSION=2.26.3
RUN mamba create -qy -p /usr/local \
    -c bioconda \
    picard-slim==${PICARD_VERSION}

# Deploy the target tools into a base image
FROM ubuntu:20.04
COPY --from=builder /usr/local /usr/local

LABEL maintainer="Aaron Holmes <aholmes@mednet.ucla.edu>"
