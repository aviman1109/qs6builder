set JAVA_HOME=jre
set JAVA_OPTS=-Xms256m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=512m
wildfly\bin\standalone -b 0.0.0.0 -Djboss.http.port=${Ets.Install.Port.Http} -Djboss.https.port=${Ets.Install.Port.Https} -Djboss.ajp.port=${Ets.Install.Port.Ajp} -Dsolr.solr.home=solr/home

REM To support cluster mode, replace previous line with the next line, and modify the parameters.
REM wildfly\bin\standalone -c standalone-ha.xml -b 0.0.0.0 -u 239.89.12.6 -Djboss.node.name=node1 -Djboss.http.port=${Ets.Install.Port.Http} -Djboss.https.port=${Ets.Install.Port.Https} -Djboss.ajp.port=${Ets.Install.Port.Ajp} -Dsolr.solr.home=solr/home
