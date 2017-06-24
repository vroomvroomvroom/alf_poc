FROM centos:7
MAINTAINER https://github.com/vroomvroomvroom 

RUN yum updateinfo

RUN yum install -y curl vi
RUN yum install -y fontconfig libSM libICE libXrender libXext cups-libs 
RUN yum install -y mesa-libGLU libGLU cairo mesa-libGL

RUN mkdir -p /opt/alfresco
WORKDIR /opt/alfresco

RUN curl http://eu.dl.alfresco.com.s3.amazonaws.com/release/community/201704-build-00019/alfresco-community-installer-201704-linux-x64.bin -o alfresco-community-installer-201704-linux-x64.bin 

RUN chmod +x alfresco-community-installer-201704-linux-x64.bin

RUN yum install -y https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
RUN yum install -y postgresql96

COPY alf_options /opt/alfresco/alf_options.opt

RUN ./alfresco-community-installer-201704-linux-x64.bin --optionfile /opt/alfresco/alf_options.opt

#RUN cat alf_install.out

RUN rm /opt/alfresco/alfresco-community-installer-201704-linux-x64.bin

## to do in this layer
## enable content store encryption

## to do in next layer
## obtain free trial .. 
## add alfstream
RUN mkdir -p /opt/alfresco/alf_data /opt/alfresco/alf_data_back
RUN mv /opt/alfresco/alf_data /opt/alfresco/alf_data_back
RUN mkdir /opt/alfresco/alf_data
COPY create.sql /
COPY check.sql /
COPY  entry.sh /
RUN   chmod +x /entry.sh
#RUN whereis psql
RUN yum install -y unzip zip

EXPOSE 8080
## remove solr
RUN rm -rf /opt/alfresco/tomcat/webapps/solr*
RUN rm /opt/alfresco/tomcat/conf/Catalina/localhost/solr4.xml
#COPY alfresco-global /opt/alfresco/tomcat/shared/classes/alfresco-global.properties
RUN /opt/alfresco/alfresco.sh start
RUN tail /opt/alfresco/tomcat/logs/catalina.out
RUN sleep 120

ENTRYPOINT ["/entry.sh"]
#ENTRYPOINT ["/opt/app/alfcom/alfresco.sh", "start"]
#ENTRYPOINT ["/bin/bash"]

