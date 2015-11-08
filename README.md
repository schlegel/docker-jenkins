# Jenkins Server

Docker image to install Jenkisn CI Server.

Already includes:

 - Jenkins
 - Java 7, Java 8 (Oracle)
 - Git, subversion
 - Maven
 - NodeJs, NPM
 - docker.io

## Usage

It's as simple as:

```
docker pull schlegel/jenkins-server
docker run --name=jenkins -u root -v /data/docker/jenkins:/var/jenkins_home -p 8080:8080 -p 50000:50000 schlegel/jenkins-server
```
