ARG MINIFORGE_VER=23.3.1-1
FROM condaforge/mambaforge:${MINIFORGE_VER} AS builder

# Use mamba to install tools and dependencies into /usr/local
ARG PICARD_VERSION=3.3.0
RUN mamba create -qy -p /usr/local \
    -c bioconda \
    -c conda-forge \
    picard-slim==${PICARD_VERSION}

# Deploy the target tools into a base image
FROM ubuntu:20.04
COPY --from=builder /usr/local /usr/local

# Add a new user/group called bldocker
RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

# Change the default user to bldocker from root
USER bldocker

LABEL maintainer="Joseph Salmingo <jsalmingo@mednet.ucla.edu>" \
      org.opencontainers.image.source=https://github.com/uclahs-cds/docker-Picard
