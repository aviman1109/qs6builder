set PATH=apache-tomcat/bin
set JRE_HOME=jre
set CATALINA_HOME=apache-tomcat
set CATALINA_OPTS=-Xms256m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=512m -Duser.language=en -Duser.country=US -Dsolr.solr.home=solr/home
apache-tomcat/bin/catalina run
