FROM rocker/tidyverse:4.3.1

# System dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    pandoc \
    && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c('rmarkdown','knitr','xfun','labelled','gtsummary','broom','broom.helpers','ggplot2','htmltools','markdown'), repos='https://cloud.r-project.org')"


# Set working directory
WORKDIR /project

# Copy R Markdown file
COPY hiv_reportupdate.Rmd /project/

# Create output folder
RUN mkdir report

# Default command
CMD ["bash"]