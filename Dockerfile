FROM jboss/wildfly:latest

ADD customization /opt/jboss/wildfly/customization/
COPY driver/module.xml /opt/jboss/wildfly/modules/com/mysql/main/
COPY driver/mysql-connector-java-5.1.36-bin.jar /opt/jboss/wildfly/modules/com/mysql/main/
COPY standalone.xml /opt/jboss/wildfly/standalone/configuration/standalone-full.xml

RUN mkdir /tmp/latamautos-static-content

USER root
RUN chmod -R 777 /opt/jboss/wildfly/customization/

RUN /opt/jboss/wildfly/bin/add-user.sh admin latam123 --silent

ENV MONGO_PORT='27017' \
	MONGO_USER='mongo' \
	MONGO_PASSWORD='mongo' \
	MONGO_CONNECTIONS_PER_HOST='100' \
	MONGO_DB="new_vehicles_catalog" \
	MONGO_HOST="me.api.latamautos.com" \
	MYSQL_HOSTNAME="ptdb.c9ngksmduxvg.us-east-1.rds.amazonaws.com" \
	MYSQL_PORT="3306" \
	MYSQL_USER="ptuser" \
	MYSQL_PASSWORD="xrtd_9039" \
	MYSQL_DB="apirds" \
    ELASTIC_HOST="me.api.latamautos.com" \
	ELASTIC_PORT="9300" \
	PROPERTIES_PATH="/tmp/latamautos-static-content" \
	JAVA_OPTS="-Xms256m -Xmx1024m -XX:MaxPermSize=512m -Djava.net.preferIPv4Stack=true" \
	API_ADMIN_JAVA=admin.api.latamautos.com \
	API_MESSAGES_JAVA=messages.api.latamautos.com \
	API_NEW_VEHICLE_CATALOG_JAVA=new-vehicles.api.latamautos.com \
	API_PORT=80


EXPOSE 8080

CMD ["/opt/jboss/wildfly/customization/execute.sh"]