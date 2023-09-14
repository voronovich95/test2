FROM amazonlinux:latest

# Install dependencies
RUN yum update -y && \
    yum install -y httpd && \
    yum search wget && \
    yum install wget -y && \
    yum install unzip -y && \
    yum install nano -y

# change directory
RUN cd /var/www/html

# download webfiles
RUN wget https://github.com/voronovich95/app/raw/main/index.html

COPY ./index.html /var/www/html

# exposes port 80 on the container
EXPOSE 80

# set the default application that will start when the container start
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
