#!/bin/sh
echo Instalando tomcat , vnc y guacamole
apt-get install tomcat6 libvncserver0 openjdk-6-jdk vnc4server fluxbox guacamole guacd libguac-client-vnc0 libguac3 guacamole-tomcat
echo Compilando WAR
cd ../guaca-src
jar cvf guacamole.war .
echo Borrando WAR viejo
rm ../final/guacamole.war
cp guacamole.war ../final
cd ../final
echo Listo , ahora a instalar


chmod 777 /etc/guacamole/user-mapping.xml
cp ./guacamole.war /var/lib/guacamole/guacamole.war
ln -s /var/lib/guacamole/guacamole.war /var/lib/tomcat6/webapps/guacamole.war
ln -s /etc/guacamole/guacamole.properties /var/lib/tomcat6/common/classes/
echo Reiniciando Tomcat
/etc/init.d/tomcat6 restart
echo cambiando permisos en traspaso
mkdir /var/lib/tomcat6/webapps/guacamole/traspaso
chmod -R 777 /var/lib/tomcat6/webapps/guacamole/traspaso
echo Listo. Ahora ejecute uguaca.sh con cada usuario a usar.
echo Listo ...
