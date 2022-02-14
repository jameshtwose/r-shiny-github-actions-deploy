FROM rocker/shiny:4.0.4
# install R packages required 
# Change the packages list to suit your needs
RUN R -e 'install.packages(c(\
              "shiny", \
              "shinythemes", \
              "plotly", \
              "rsconnect"), \
            repos="https://packagemanager.rstudio.com/cran/__linux__/focal/2021-04-23"\
          )'
WORKDIR /home/shinyusr
COPY app.R app.R 
COPY deploy.R deploy.R
CMD Rscript deploy.R

# # get shiny server and R from the rocker project
# FROM rocker/shiny:4.0.5

# # system libraries
# # Try to only install system libraries you actually need
# # Package Manager is a good resource to help discover system deps
# RUN apt-get update && apt-get install -y \
#     libcurl4-gnutls-dev \
#     libssl-dev
  

# # install R packages required 
# # Change the packages list to suit your needs
# RUN R -e 'install.packages(c(\
#               "shiny", \
#               "shinythemes", \
#               "plotly", \
#               "rsconnect"), \
#             repos="https://packagemanager.rstudio.com/cran/__linux__/focal/2021-04-23"\
#           )'


# # copy the app directory into the image
# COPY ./shiny-app/* /srv/shiny-server/
# # COPY ./r-shiny-github-actions-deploy/* /srv/shiny-server/

# # run app
# CMD ["/usr/bin/shiny-server"]