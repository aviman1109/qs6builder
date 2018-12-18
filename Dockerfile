FROM java:openjdk-7-jdk
ADD . /tmp/qs-build/
RUN chmod 777 -R /tmp/qs-build/bin/
RUN chmod +x /tmp/qs-build/bin/local/qs6/build-linux.sh
# RUN chmod +x /tmp/qs-build/bin/local/qs6/setParameter.sh
RUN chmod 777 /tmp/qs-build/bin/local/qs6/settings.xml
RUN chmod 777 -R /tmp/qs-build/output/
# RUN cat settings.xml
RUN ls -al /tmp/qs-build/bin/local/qs6/
# RUN chmod +x /tmp/qs-build/bin/local/qs6/setting.sh
# RUN /tmp/qs-build/bin/local/qs6/setting.sh
# RUN /tmp/qs-build/bin/local/qs6/build-linux.sh
# RUN ["/tmp/qs-build/bin/local/qs6/setting.sh"]
ENTRYPOINT /tmp/qs-build/bin/local/qs6/build-linux.sh && echo Success || echo Failure