FROM java:8

MAINTAINER Timo Pagel <dependencycheckmaintainer@timo-pagel.de>


RUN wget http://dl.bintray.com/jeremy-long/owasp/dependency-check-1.4.0-release.zip && unzip dependency-check-1.4.0-release.zip && mv dependency-check /usr/share/
VOLUME "/src /usr/share/dependency-check/data /report"

RUN useradd -ms /bin/bash dockeruser
RUN chown -R dockeruser /usr/share/dependency-check
USER dockeruser


WORKDIR /report
ENTRYPOINT /usr/share/dependency-check/bin/dependency-check.sh --scan "/src" --project "dependeny-check-project" --format "ALL" 

