FROM appscode/oracle-jdk:8

ENV GRADLE_VER 2.13
ENV GRADLE_HOME /usr/lib/gradle-$GRADLE_VER

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates git wget curl unzip

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends ant maven \
  && wget https://services.gradle.org/distributions/gradle-$GRADLE_VER-bin.zip \
  && unzip -o gradle-$GRADLE_VER-bin.zip -d /usr/lib \
  && rm -rf gradle-$GRADLE_VER-bin.zip

ENV PATH $GRADLE_HOME/bin:$PATH

RUN set -x \
  && apt-get install -y --no-install-recommends python-pip python-all-dev

RUN set -x \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*
