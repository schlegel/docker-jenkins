FROM jenkins
MAINTAINER Kai Schlegel "kai.schlegel@googlemail.com"

USER root

# add webupd8 repository.
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

# Make sure we get latet packages
RUN apt-get update && apt-get upgrade -y

# Install Java7, Java8, NodeJs, NPM, Docker and VCS tools
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -yq oracle-java7-installer oracle-java8-installer git subversion nodejs maven npm docker.io

# backward compatibility with node naming
RUN ln -s /usr/bin/nodejs /usr/bin/node

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER jenkins
