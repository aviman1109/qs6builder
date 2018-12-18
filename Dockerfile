FROM java:openjdk-7-jdk
ADD . /tmp/qs-build/
RUN chmod 777 -R /tmp/qs-build/bin/ /tmp/qs-build/output/ \
&& chmod 777 /tmp/qs-build/bin/local/qs6/settings.xml /tmp/qs-build/bin/local/qs6/build-linux.sh /tmp/qs-build/bin/local/qs6/setParameter.sh
ENTRYPOINT cd /tmp/qs-build/bin/local/qs6 && ./build-linux.sh && echo Success || echo Failure