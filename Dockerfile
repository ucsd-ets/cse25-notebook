# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ghcr.io/ucsd-ets/scipy-ml-notebook:2025.1-stable

FROM $BASE_CONTAINER

LABEL maintainer="CSE 25"

# 2) change to root to install packages
USER root

RUN apt update && \
    apt-get -y install graphviz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 3) install packages using notebook user
USER jovyan

# RUN conda install -y scikit-learn

#RUN pip install --no-cache-dir networkx scipy

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
