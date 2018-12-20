FROM java:openjdk-7-jdk
ADD . /tmp/qs-build/
RUN chmod 777 -R /tmp/qs-build/bin/ /tmp/qs-build/output/\
&& chmod 777 /tmp/qs-build/bin/local/304-bill/settings.xml \
 /tmp/qs-build/bin/local/304-bill/build-linux.sh \
 /tmp/qs-build/bin/local/304-bill/setParameter.sh
ENTRYPOINT cd /tmp/qs-build/bin/local/304-bill && ./build-linux.sh && echo "Thank you for your watching. Eveything is fine." || echo "Please call Casper. 1338"