FROM java:openjdk-7-jdk
# ADD . /qs-build/
ADD . /tmp/qs-build/
# COPY . /qs-build/
RUN chmod 777 -R /tmp/qs-build/bin/ /tmp/qs-build/output/ \
&& chmod 777 /tmp/qs-build/bin/local/qs6/settings.xml /tmp/qs-build/bin/local/qs6/build-linux.sh
# RUN chmod +x /tmp/qs-build/bin/local/qs6/build-linux.sh
# RUN chmod +x /tmp/qs-build/bin/local/qs6/setParameter.sh
# RUN chmod 777 /tmp/qs-build/bin/local/qs6/settings.xml
# RUN chmod 777 -R /tmp/qs-build/output/
# RUN chmod +x /tmp/qs-build/bin/local/qs6/setting.sh
# RUN /tmp/qs-build/bin/local/qs6/setting.sh
# RUN /tmp/qs-build/bin/local/qs6/build-linux.sh
# RUN ["/tmp/qs-build/bin/local/qs6/setting.sh"]
ENTRYPOINT /tmp/qs-build/bin/local/qs6/build-linux.sh && echo Success || echo Failure