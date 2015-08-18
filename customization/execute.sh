#!/bin/bash

# Usage: execute.sh [WildFly mode] [configuration file]
#
# The default mode is 'standalone' and default configuration is based on the
# mode. It can be 'standalone.xml' or 'domain.xml'.

JBOSS_HOME=/opt/jboss/wildfly
JBOSS_CLI=$JBOSS_HOME/bin/jboss-cli.sh
JBOSS_MODE=${1:-"standalone"}
JBOSS_CONFIG=${2:-"standalone-full.xml"}
JBOSS_INTERFACES_ACCESS="0.0.0.0"
JBOSS_MANAGEMENT_ACCESS="0.0.0.0"
JBOSS_DEPENDENCIES="javax.api,javax.transaction.api"

MYSQL_CONNECTOR_VERSION="5.1.36"
# MYSQL_HOSTNAME="172.16.10.51"
# MYSQL_PORT="3306"
# MYSQL_USERNAME="root"
# MYSQL_PASSWORD="root"
# MYSQL_DBNAME="apirds"
#MYSQL_PASSWORD="LATAMsnSVptgAPILNvX5CdrKPASS"

# export $MYSQL_HOSTNAME
# export $MYSQL_USERNAME
# export $MYSQL_PASSWORD
# export $MYSQL_PORT
# export $MYSQL_DBNAME

# function wait_for_server() {
#   until `$JBOSS_CLI -c "ls /deployment" &> /dev/null`; do
#     sleep 1
#   done
# }

# echo "=> Starting WildFly server"
# $JBOSS_HOME/bin/$JBOSS_MODE.sh -b $JBOSS_INTERFACES_ACCESS -bmanagement $JBOSS_MANAGEMENT_ACCESS -c $JBOSS_CONFIG &

# echo "=> Waiting for the server to boot"
# wait_for_server

# #echo "=> Executing the commands"
# #echo "=> MYSQL_HOST: " $MYSQL_HOST
# #echo "=> MYSQL_PORT: " $MYSQL_PORT
# #echo "=> MYSQL (docker host): " $DB_PORT_3306_TCP_ADDR
# #echo "=> MYSQL (docker port): " $DB_PORT_3306_TCP_PORT
# #echo "=> MYSQL (kubernetes host): " $MYSQL_SERVICE_HOST
# #echo "=> MYSQL (kubernetes port): " $MYSQL_SERVICE_PORT
# #$JBOSS_CLI -c --file=`dirname "$0"`/commands.cli
# $JBOSS_CLI -c << EOF
# batch

# # Add MySQL module
# module add --name=com.mysql --resources=$JBOSS_HOME/customization/mysql-connector-java-$MYSQL_CONNECTOR_VERSION-bin.jar --dependencies=$JBOSS_DEPENDENCIES

# # Add MySQL driver
# /subsystem=datasources/jdbc-driver=mysql:add(driver-name=mysql,driver-module-name=com.mysql,driver-xa-datasource-class-name=com.mysql.jdbc.jdbc2.optional.MysqlXADataSource)

# # Add the datasource
# data-source add --name=mysqlDS --driver-name=mysql --jndi-name=java:jboss/datasources/ExampleMySQLDS --connection-url=jdbc:mysql://$MYSQL_HOSTNAME:$MYSQL_PORT/$MYSQL_DB?useUnicode=true&amp;characterEncoding=UTF-8 --user-name=$MYSQL_USER --password=$MYSQL_PASSWORD --use-ccm=false --max-pool-size=25 --blocking-timeout-wait-millis=5000 --enabled=true
# #data-source add --name=mysqlDS --driver-name=mysql --jndi-name=java:jboss/datasources/ExampleMySQLDS --connection-url=jdbc:mysql://$MYSQL_SERVICE_HOST:$MYSQL_SERVICE_PORT/sample?useUnicode=true&amp;characterEncoding=UTF-8 --user-name=mysql --password=mysql --use-ccm=false --max-pool-size=25 --blocking-timeout-wait-millis=5000 --enabled=true
# #data-source add --name=mysqlDS --driver-name=mysql --jndi-name=java:jboss/datasources/ExampleMySQLDS --connection-url=jdbc:mysql://$DB_PORT_3306_TCP_ADDR:$DB_PORT_3306_TCP_PORT/sample?useUnicode=true&amp;characterEncoding=UTF-8 --user-name=mysql --password=mysql --use-ccm=false --max-pool-size=25 --blocking-timeout-wait-millis=5000 --enabled=true

# # Execute the batch
# run-batch
# EOF

# # Deploy the WAR
# #cp /opt/jboss/wildfly/customization/employees.war $JBOSS_HOME/$JBOSS_MODE/deployments/employees.war

# echo "=> Shutting down WildFly"
# if [ "$JBOSS_MODE" = "standalone" ]; then
#   $JBOSS_CLI -c ":shutdown"
# else
#   $JBOSS_CLI -c "/host=*:shutdown"
# fi

# echo "=> Restarting WildFly"
$JBOSS_HOME/bin/$JBOSS_MODE.sh -b $JBOSS_INTERFACES_ACCESS -bmanagement $JBOSS_MANAGEMENT_ACCESS -c $JBOSS_CONFIG

