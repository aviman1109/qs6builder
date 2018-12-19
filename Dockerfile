FROM java:openjdk-7-jdk
ADD . /tmp/qs-build/
RUN chmod 777 -R /tmp/qs-build/bin/ /tmp/qs-build/output/\
&& chmod 777 /tmp/qs-build/bin/local/304-bill/settings.xml \
 /tmp/qs-build/bin/local/304-bill/build-linux.sh \
 /tmp/qs-build/bin/local/304-bill/setParameter.sh
# RUN chmod 777 -R /tmp/qs-build/output/
# RUN chmod 777 /tmp/qs-build/bin/local/304-bill/settings.xml
# RUN chmod 777 /tmp/qs-build/bin/local/304-bill/build-linux.sh
# RUN chmod 777 /tmp/qs-build/bin/local/304-bill/setParameter.sh
ENTRYPOINT cd /tmp/qs-build/bin/local/304-bill && ./build-linux.sh && echo "build-linux.sh execute Success" || echo "build-linux.sh execute Failure"