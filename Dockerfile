FROM java:openjdk-7-jdk
# ADD . /qs-build/
ADD . /tmp/qs-build/
# COPY . /qs-build/
RUN chmod +x /tmp/qs-build/bin/local/304-bill/build-linux.sh \
    chmod +x /tmp/qs-build/bin/local/304-bill/setParameter.sh
# RUN chmod +x /tmp/qs-build/bin/local/304-bill/setting.sh
# RUN /tmp/qs-build/bin/local/304-bill/setting.sh
# RUN /tmp/qs-build/bin/local/304-bill/build-linux.sh
# RUN ["/tmp/qs-build/bin/local/304-bill/setting.sh"]
ENTRYPOINT ["/tmp/qs-build/bin/local/304-bill/build-linux.sh"]