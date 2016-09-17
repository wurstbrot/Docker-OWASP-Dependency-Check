# Docker-OWASP-Dependency-Check

Usage:
```
if [ ! -e $HOME/OWASP-Dependency-Check-Data/data ]; then
	mkdir -p $HOME/OWASP-Dependency-Check-Data/data
        chmod -R 777 $HOME/OWASP-Dependency-Check-Data/data
    
        mkdir -p $HOME/OWASP-Dependency-Check-Data/report
        chmod -R 777 $HOME/OWASP-Dependency-Check-Data/report
fi

docker pull fhunii/docker-owasp-dependency-check # Make sure it is the actual version

docker run --rm -v $(pwd):/src \
	--volume $HOME/OWASP-Dependency-Check-Data/data:/usr/share/dependency-check/data \
        --volume $WORKSPACE/report:/report \
	--format "ALL" \
	--suppression "/src/security/dependency-check-suppression.xml"\
        --name dependency-check \
        fhunii/docker-owasp-dependency-check 
```
