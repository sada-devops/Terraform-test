#pull base image

FROM ubuntu:18.04

#update and install apache2

RUN apt-get update -y
RUN apt install utils
RUN apt install apache2 -y
RUN service apache2 status