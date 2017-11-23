#!/bin/bash

#
# Pentaho CE - Download, unzip and move the folder to "/opt"
#

#PENTAHO_CE="biserver-ce-5.1.0.0-752.zip"
#PENTAHO_URL="http://downloads.sourceforge.net/project/pentaho/Business%20Intelligence%20Server/5.1"

PENTAHO_CE="pentaho-server-ce-7.1.0.0-12.zip"
PENTAHO_URL="http://downloads.sourceforge.net/project/pentaho/Business%20Intelligence%20Server/7.1"

if [ ! -f /vagrant/downloads/$PENTAHO_CE ]; then
    echo "Downloading Pentaho CE ($PENTAHO_CE)"
	mkdir -p /vagrant/downloads/
	wget -q $PENTAHO_URL/$PENTAHO_CE -P /vagrant/downloads/
fi

echo "Installing Pentaho CE ($PENTAHO_CE)"
mkdir -p /opt/pentaho/
unzip -q /vagrant/downloads/$PENTAHO_CE -d /opt/pentaho/

fnInstallPentahoCE(){

	echo "Configuring Pentaho CE BI Installation"

	# Create support databases
	sudo -u postgres psql -a -f /opt/pentaho/biserver-ce/data/postgresql/create_jcr_postgresql.sql
	sudo -u postgres psql -a -f /opt/pentaho/biserver-ce/data/postgresql/create_repository_postgresql.sql
	sudo -u postgres psql -a -f /opt/pentaho/biserver-ce/data/postgresql/create_quartz_postgresql.sql
	sudo -u postgres psql -a quartz -c 'CREATE TABLE "QRTZ"(NAME VARCHAR(200) NOT NULL,PRIMARY KEY (NAME));'

	# Download PostgreSQL JDBC driver
	cd /usr/share/java
	wget jdbc.postgresql.org/download/postgresql-9.3-1102.jdbc4.jar

	# Symlink for naming
	ln -s postgresql-9.3-1102.jdbc4.jar postgresql-9.3-jdbc4.jar

	# Symlink for the Pentaho's Tomcat folder
	cd /opt/pentaho/biserver-ce/tomcat/lib
	ln -s /usr/share/java/postgresql-9.3-jdbc4.jar postgresql-9.3-jdbc4.jar

	# Pentaho context.xml configuration
	sed -i s/"org.hsqldb.jdbcDriver"/"org.postgresql.Driver"/g /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml
	sed -i s/"jdbc:hsqldb:hsql:\/\/localhost\/hibernate"/"jdbc:postgresql:\/\/localhost:5432\/hibernate"/g /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml
	sed -i s/"select count(\*) from INFORMATION_SCHEMA.SYSTEM_SEQUENCES"/"select 1"/g /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml
	sed -i s/"org.hsqldb.jdbcDriver"/"org.postgresql.Driver"/g /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml
	sed -i s/"jdbc:hsqldb:hsql:\/\/localhost\/quartz"/"jdbc:postgresql:\/\/localhost:5432\/quartz"/g /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml
	sed -i s/"select count(\*) from INFORMATION_SCHEMA.SYSTEM_SEQUENCES"/"select 1"/g /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml

	# Pentaho's applicationContext-spring-security-hibernate.properties
	sed -i s/"org.hsqldb.jdbcDriver"/"org.postgresql.Driver"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/applicationContext-spring-security-hibernate.properties
	sed -i s/"jdbc:hsqldb:hsql:\/\/localhost\/hibernate"/"jdbc:postgresql:\/\/localhost:5432\/hibernate"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/applicationContext-spring-security-hibernate.properties

	# Pentaho's hibernate-settings.xml
	sed -i s/"system\/hibernate\/hsql.hibernate.cfg.xml"/"system\/hibernate\/postgresql.hibernate.cfg.xml"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/hibernate/hibernate-settings.xml

	# Pentaho's jdbc.properties
	sed -i s/"SampleData\/type=javax.sql.DataSource"/"#SampleData\/type=javax.sql.DataSource"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleData\/driver=org.hsqldb.jdbcDriver"/"#SampleData\/driver=org.hsqldb.jdbcDriver"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleData\/url=jdbc:hsqldb:hsql:\/\/localhost\/sampledata"/"#SampleData\/url=jdbc:hsqldb:hsql:\/\/localhost\/sampledata"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleData\/user=pentaho_user"/"#SampleData\/user=pentaho_user"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleData\/password=password"/"#SampleData\/password=password"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Hibernate\/driver=org.hsqldb.jdbcDriver"/"Hibernate\/driver=org.postgresql.Driver"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Hibernate\/url=jdbc:hsqldb:hsql:\/\/localhost\/hibernate"/"Hibernate\/url=jdbc:postgresql:\/\/localhost:5432\/hibernate"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Quartz\/driver=org.hsqldb.jdbcDriver"/"Quartz\/driver=org.postgresql.Driver"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Quartz\/url=jdbc:hsqldb:hsql:\/\/localhost\/quartz"/"Quartz\/url=jdbc:postgresql:\/\/localhost:5432\/quartz"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Shark\/type=javax.sql.DataSource"/"#Shark\/type=javax.sql.DataSource"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Shark\/driver=org.hsqldb.jdbcDriver"/"#Shark\/driver=org.hsqldb.jdbcDriver"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Shark\/url=jdbc:hsqldb:hsql:\/\/localhost\/shark"/"#Shark\/url=jdbc:hsqldb:hsql:\/\/localhost\/shark"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Shark\/user=sa"/"#Shark\/user=sa"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Shark\/password="/"#Shark\/password="/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleDataAdmin\/type=javax.sql.DataSource"/"#SampleDataAdmin\/type=javax.sql.DataSource"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleDataAdmin\/driver=org.hsqldb.jdbcDriver"/"#SampleDataAdmin\/driver=org.hsqldb.jdbcDriver"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleDataAdmin\/url=jdbc:hsqldb:hsql:\/\/localhost\/sampledata"/"#SampleDataAdmin\/url=jdbc:hsqldb:hsql:\/\/localhost\/sampledata"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleDataAdmin\/user=pentaho_admin"/"#SampleDataAdmin\/user=pentaho_admin"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleDataAdmin\/password=password"/"#SampleDataAdmin\/password=password"/g /opt/pentaho/biserver-ce/pentaho-solutions/system/simple-jndi/jdbc.properties

	# Permission check
	chmod +x /opt/pentaho/biserver-ce/*.sh

	# Install the service into systemd
	cp /vagrant/configs/pentaho-bi.service /etc/systemd/system/
	# Enable automatic startup
	systemctl enable pentaho-bi.service
	# Start pentaho
	systemctl start pentaho-bi.service
}

fnInstallPentahoServer(){

	echo "Configuring Pentaho CE Server Installation"
	
	# Create support databases
	sudo -u postgres psql -a -f /opt/pentaho/pentaho-server/data/postgresql/create_jcr_postgresql.sql
	sudo -u postgres psql -a -f /opt/pentaho/pentaho-server/data/postgresql/create_repository_postgresql.sql
	sudo -u postgres psql -a -f /opt/pentaho/pentaho-server/data/postgresql/create_quartz_postgresql.sql
	sudo -u postgres psql -a quartz -c 'CREATE TABLE "QRTZ"(NAME VARCHAR(200) NOT NULL,PRIMARY KEY (NAME));'

	# Download PostgreSQL JDBC driver
	cd /usr/share/java
	wget jdbc.postgresql.org/download/postgresql-9.3-1102.jdbc4.jar

	# Symlink for naming
	ln -s postgresql-9.3-1102.jdbc4.jar postgresql-9.3-jdbc4.jar

	# Symlink for the Pentaho's Tomcat folder
	cd /opt/pentaho/pentaho-server/tomcat/lib
	ln -s /usr/share/java/postgresql-9.3-jdbc4.jar postgresql-9.3-jdbc4.jar

	# Pentaho context.xml configuration
	sed -i s/"org.hsqldb.jdbcDriver"/"org.postgresql.Driver"/g /opt/pentaho/pentaho-server/tomcat/webapps/pentaho/META-INF/context.xml
	sed -i s/"jdbc:hsqldb:hsql:\/\/localhost\/hibernate"/"jdbc:postgresql:\/\/localhost:5432\/hibernate"/g /opt/pentaho/pentaho-server/tomcat/webapps/pentaho/META-INF/context.xml
	sed -i s/"select count(\*) from INFORMATION_SCHEMA.SYSTEM_SEQUENCES"/"select 1"/g /opt/pentaho/pentaho-server/tomcat/webapps/pentaho/META-INF/context.xml
	sed -i s/"org.hsqldb.jdbcDriver"/"org.postgresql.Driver"/g /opt/pentaho/pentaho-server/tomcat/webapps/pentaho/META-INF/context.xml
	sed -i s/"jdbc:hsqldb:hsql:\/\/localhost\/quartz"/"jdbc:postgresql:\/\/localhost:5432\/quartz"/g /opt/pentaho/pentaho-server/tomcat/webapps/pentaho/META-INF/context.xml
	sed -i s/"select count(\*) from INFORMATION_SCHEMA.SYSTEM_SEQUENCES"/"select 1"/g /opt/pentaho/pentaho-server/tomcat/webapps/pentaho/META-INF/context.xml

	# Pentaho's applicationContext-spring-security-hibernate.properties
	sed -i s/"org.hsqldb.jdbcDriver"/"org.postgresql.Driver"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/applicationContext-spring-security-hibernate.properties
	sed -i s/"jdbc:hsqldb:hsql:\/\/localhost\/hibernate"/"jdbc:postgresql:\/\/localhost:5432\/hibernate"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/applicationContext-spring-security-hibernate.properties

	# Pentaho's hibernate-settings.xml
	sed -i s/"system\/hibernate\/hsql.hibernate.cfg.xml"/"system\/hibernate\/postgresql.hibernate.cfg.xml"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/hibernate/hibernate-settings.xml

	# Pentaho's jdbc.properties
	sed -i s/"SampleData\/type=javax.sql.DataSource"/"#SampleData\/type=javax.sql.DataSource"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleData\/driver=org.hsqldb.jdbcDriver"/"#SampleData\/driver=org.hsqldb.jdbcDriver"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleData\/url=jdbc:hsqldb:hsql:\/\/localhost\/sampledata"/"#SampleData\/url=jdbc:hsqldb:hsql:\/\/localhost\/sampledata"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleData\/user=pentaho_user"/"#SampleData\/user=pentaho_user"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleData\/password=password"/"#SampleData\/password=password"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Hibernate\/driver=org.hsqldb.jdbcDriver"/"Hibernate\/driver=org.postgresql.Driver"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Hibernate\/url=jdbc:hsqldb:hsql:\/\/localhost\/hibernate"/"Hibernate\/url=jdbc:postgresql:\/\/localhost:5432\/hibernate"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Quartz\/driver=org.hsqldb.jdbcDriver"/"Quartz\/driver=org.postgresql.Driver"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Quartz\/url=jdbc:hsqldb:hsql:\/\/localhost\/quartz"/"Quartz\/url=jdbc:postgresql:\/\/localhost:5432\/quartz"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Shark\/type=javax.sql.DataSource"/"#Shark\/type=javax.sql.DataSource"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Shark\/driver=org.hsqldb.jdbcDriver"/"#Shark\/driver=org.hsqldb.jdbcDriver"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Shark\/url=jdbc:hsqldb:hsql:\/\/localhost\/shark"/"#Shark\/url=jdbc:hsqldb:hsql:\/\/localhost\/shark"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Shark\/user=sa"/"#Shark\/user=sa"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"Shark\/password="/"#Shark\/password="/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleDataAdmin\/type=javax.sql.DataSource"/"#SampleDataAdmin\/type=javax.sql.DataSource"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleDataAdmin\/driver=org.hsqldb.jdbcDriver"/"#SampleDataAdmin\/driver=org.hsqldb.jdbcDriver"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleDataAdmin\/url=jdbc:hsqldb:hsql:\/\/localhost\/sampledata"/"#SampleDataAdmin\/url=jdbc:hsqldb:hsql:\/\/localhost\/sampledata"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleDataAdmin\/user=pentaho_admin"/"#SampleDataAdmin\/user=pentaho_admin"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	sed -i s/"SampleDataAdmin\/password=password"/"#SampleDataAdmin\/password=password"/g /opt/pentaho/pentaho-server/pentaho-solutions/system/simple-jndi/jdbc.properties
	
	# Less java resources consumption
	sed -i s/"-Xms2048m -Xmx6144m -XX:MaxPermSize=256m"/"-Xms768m -Xmx2048m -XX:MaxPermSize=256m"/g /opt/pentaho/pentaho-server/start-pentaho.sh

	# Permission check
	chmod +x /opt/pentaho/pentaho-server/*.sh

	# Install the service into systemd
	cp /vagrant/configs/pentaho-server.service /etc/systemd/system/
	
	# Enable automatic startup
	systemctl enable pentaho-server.service
	
	# Disable automatic startup for other version
	# systemctl disable pentaho-bi.service
	
	# Start pentaho
	systemctl start pentaho-server.service
}


#fnInstallPentahoCE
fnInstallPentahoServer