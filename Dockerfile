#pull base image

FROM ubuntu:18.04

#update and install apache2

RUN sudo apt-get update -y
RUN sudo apt install apache2 -y