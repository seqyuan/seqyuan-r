FROM r-base:latest

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

MAINTAINER Zan Yuan <seqyuan@gmail.com>

RUN apt-get update && apt-get install -y \
    sudo \
    gdebi-core \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    xtail \
    libssl-dev \
    build-essential \
    libxml2-dev \
    libhdf5-dev \
    libudunits2-dev \
    imagemagick \
    wget

RUN Rscript -e "install.packages(c('remotes', 'ggplot2', 'Seurat', 'BiocManager', 'devtools', 'dplyr', 'rstatix'))"
RUN Rscript -e "remotes::install_github('sunduanchen/Scissor', upgrade='never')"
RUN Rscript -e "remotes::install_github('YuLab-SMU/clusterProfiler', upgrade='never')"

#ADD context/passwd /etc/
#ADD context/group /etc/
