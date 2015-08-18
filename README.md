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

2- git clone git@github.com:latamautos/docker-WildFly-Server.git
                          o
   git clone https://github.com/latamautos/docker-WildFly-Server.git

3- git clone git@github.com:latamautos/latamautos-static-content.git
			  o
   git clone https://github.com/latamautos/latamautos-static-content.git


4- cd docker-WildFly-Server

5- docker build -t wildfly/server

6- docker run -d  --name wildfly-server -e "isDevelopmentMode=false" -v /home/ec2-user/wildfly/deployments/:/opt/jboss/wildfly/standalone/deployments/  -v /home/ec2-user/shared/:/tmp/ -p 80:8080 --restart=always  wildfly/server
