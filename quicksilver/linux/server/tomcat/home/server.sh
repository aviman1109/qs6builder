export PATH=jre/bin:$PATH
export JRE_HOME=jre
export CATALINA_OPTS="-Xms256m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=512m -Dsolr.solr.home=solr/home -Duser.language=en -Duser.country=US -Djava.library.path=jre/lib/amd64 -Djava.net.preferIPv4Stack=true"
apache-tomcat/bin/catalina.sh run
