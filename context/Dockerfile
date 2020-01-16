FROM r-base:latest

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN echo "deb https://mirrors.ustc.edu.cn/debian/ stretch main contrib non-free" >> /etc/apt/sources.list && \
		echo "deb-src https://mirrors.ustc.edu.cn/debian/ stretch main contrib non-free" >> /etc/apt/sources.list && \
		echo "deb https://mirrors.ustc.edu.cn/debian/ stretch-updates main contrib non-free" >> /etc/apt/sources.list && \
		echo "deb-src https://mirrors.ustc.edu.cn/debian/ stretch-updates main contrib non-free" >> /etc/apt/sources.list && \
		echo "deb https://mirrors.ustc.edu.cn/debian/ stretch-backports main contrib non-free" >> /etc/apt/sources.list && \
		echo "deb-src https://mirrors.ustc.edu.cn/debian/ stretch-backports main contrib non-free" >> /etc/apt/sources.list && \
		echo "deb https://mirrors.ustc.edu.cn/debian-security/ stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
		echo "deb-src https://mirrors.ustc.edu.cn/debian-security/ stretch/updates main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y libssl-dev
RUN apt-get install -y libcurl4-openssl-dev libssl-dev 
RUN apt-get install -y build-essential libxml2-dev libssl-dev libcurl4-openssl-dev
RUN if [ -e /bin/sh ];then rm /bin/sh ; fi && \
		if [ -e /bin/bash ];then ln -s /bin/bash /bin/sh ; fi

RUN R -e "install.packages('BiocManager', repos='https://mirrors.tuna.tsinghua.edu.cn/CRAN/')"
RUN R -e "install.packages('devtools', repos='https://mirrors.tuna.tsinghua.edu.cn/CRAN/')"
RUN apt-get install -y libhdf5-dev libudunits2-dev imagemagick
#COPY Rprofile ~/.Rprofile
RUN echo "GITHUB_PAT=d976a8efad6881f1b474795f8ec6d4ab9ffdc4ca" >>~/.Renviron
RUN R -e "devtools::install_github('dynverse/dyno')"
RUN echo "export PATH=$PATH:/dockerbin" >> ~/.bashrc
RUN R -e "install.packages('tidyverse', repos='https://mirrors.tuna.tsinghua.edu.cn/CRAN/')"
RUN R -e "BiocManager::install('mutoss')"
RUN R -e "install.packages(c('Seurat'), repos='http://mirrors.tuna.tsinghua.edu.cn/CRAN/')"

EXPOSE 3889

#RUN apt-get update && apt-get install -y singularity-container

#RUN echo "options(shiny.port = 3889, shiny.host = '0.0.0.0', shiny.launch.browser = FALSE)" >> /etc/R/Rprofile.site
#EXPOSE 3889
