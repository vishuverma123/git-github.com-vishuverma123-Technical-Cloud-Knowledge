FROM ubuntu:14.04

# Update package list and install Apache and unzip
RUN apt-get update && \
    apt-get install -y apache2 unzip

# Download and unzip the CSS template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip carvilla.zip && \
    cp -rvf carvilla-v1.0/* . && \
    rm -r carvilla.zip carvilla-v1.0

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

