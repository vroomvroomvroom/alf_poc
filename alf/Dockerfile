FROM centos:7
MAINTAINER https://github.com/vroomvroomvroom 

RUN yum updateinfo

RUN yum install -y curl vi

RUN mkdir -p /opt/alfresco
WORKDIR /opt/alfresco

RUN curl http://eu.dl.alfresco.com.s3.amazonaws.com/release/community/201704-build-00019/alfresco-community-installer-201704-linux-x64.bin -o alfresco-community-installer-201704-linux-x64.bin 

RUN chmod +x alfresco-community-installer-201704-linux-x64.bin

COPY alf_options.opt /opt/alfresco/alf_options.opt

RUN ./alfresco-community-installer-201704-linux-x64.bin --optionfile /opt/alfresco/alf_options.opt

## to do in this layer
## enable content store encryption

## to do in next layer
## obtain free trial .. 
## add alfstream





