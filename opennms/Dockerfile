FROM centos:centos7
MAINTAINER Deven Phillips <deven.phillips@sungardas.com>

WORKDIR /tmp
RUN curl -o opennms.rpm http://yum.opennms.org/repofiles/opennms-repo-testing-rhel7.noarch.rpm
RUN rpm -Uvh opennms.rpm
ADD scripts/install_JDK7.sh /usr/bin/install_JDK7.sh
RUN chmod 755 /usr/bin/install_JDK7.sh
RUN /usr/bin/install_JDK7.sh
RUN yum -y -q install opennms jrrd jrrd2
RUN /opt/opennms/bin/runjava -S /usr/java/latest/bin/java

ADD scripts/install_epel.sh /usr/bin/install_epel.sh
RUN chmod 755 /usr/bin/install_epel.sh
RUN /usr/bin/install_epel.sh

RUN yum -y -q install supervisor
ADD opennms.ini /etc/supervisord.d/

ENV OPENNMS_DATA=/data/opennms
ENV OPENNMS_DB_USER=opennms
ENV OPENNMS_DB_NAME=opennms
ENV OPENNMS_DB_USER_PASSWORD=opennms

ADD scripts/start /usr/bin/start
RUN chmod 755 /usr/bin/start
CMD /usr/bin/start

EXPOSE 8980
EXPOSE 8180
