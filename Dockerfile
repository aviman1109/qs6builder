FROM java:openjdk-7-jdk
ADD . /tmp/qs-build/
RUN chmod 777 -R /tmp/qs-build/bin/ /tmp/qs-build/output/\
 /tmp/qs-build/bin/local/ 
ENTRYPOINT cd /tmp/qs-build/bin/ && ./build.sh && echo "Thank you for your watching. Eveything is fine." || echo "Please call Casper. 1338"