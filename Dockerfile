#pull base image

FROM ubuntu

#update and install apache2

RUN apt-get update -y
RUN apt install apache2 -y
RUN service apache2 status