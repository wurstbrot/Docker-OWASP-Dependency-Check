FROM java:8

MAINTAINER Timo Pagel <dependencycheckmaintainer@timo-pagel.de>

RUN wget http://dl.bintray.com/jeremy-long/owasp/dependency-check-1.4.0-release.zip && unzip dependency-check-1.4.0-release.zip && mv dependency-check /usr/share/
WORKDIR /usr/share/dependency-check/
VOLUME "/src /usr/share/dependency-check/data"
ENTRYPOINT /usr/share/dependency-check/bin/dependency-check.sh --scan "/src" --project "dependeny-check-project" 

