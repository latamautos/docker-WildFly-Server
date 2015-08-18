# docker
Docker repository of files.

Structur WildFly/Server

 |── wildfly_server
    ├── Dockerfile
    ├── customization
    │   └── execute.sh
    ├── driver
    │   ├── module.xml
    │   └── mysql-connector-java-${version}-bin.jar
    └── standalone.xml


Command to run Wildfly/Server

1- cd $HOME

2- mkdir -p wildfly/deployments

3- git clone git@github.com:latamautos/docker-WildFly-Server.git
                          o
   git clone https://github.com/latamautos/docker-WildFly-Server.git

4- git clone git@github.com:latamautos/latamautos-static-content.git
			  o
   git clone https://github.com/latamautos/latamautos-static-content.git


5- cd docker-WildFly-Server

6- docker build -t wildfly/server

7- docker run -d  --name wildfly-server -e "isDevelopmentMode=false" -v $HOME/wildfly/deployments/:/opt/jboss/wildfly/standalone/deployments/  -v $HOME/shared/:/tmp/ -p 80:8080 --restart=always  wildfly/server
