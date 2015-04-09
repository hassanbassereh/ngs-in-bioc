
FROM bioconductor/release_base
MAINTAINER Mark Dunning<mark.dunning@cruk.cam.ac.uk>


RUN apt-get update && apt-get install -y git
###Get repository of the course. Install data and R packages
RUN git clone https://github.com/bioinformatics-core-shared-training/ngs-in-bioc.git /home/rstudio/cruk-bioinf-training 
WORKDIR /home/rstudio/cruk-bioinf-training 
RUN wget https://www.dropbox.com/s/ve6o68hkbthe3lo/exampleData.zip
RUN unzip exampleData.zip
RUN R -f installBioCPkgs.R
RUN rm -r images javascripts stylesheets params.json index.html