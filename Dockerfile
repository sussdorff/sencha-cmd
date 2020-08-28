FROM openjdk:8-jre-slim
	
RUN apt-get update && apt-get install -y --no-install-recommends \
	    curl \
	    unzip \
		libfreetype6 \
		fontconfig \
        openssh-client \
        rsync \
	&& apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*
	
# Installing SenchaCmd
RUN curl --silent http://cdn.sencha.com/cmd/7.2.0.84/no-jre/SenchaCmd-7.2.0.84-linux-amd64.sh.zip -o /tmp/sencha.zip && \
	unzip /tmp/sencha.zip -d /tmp  && \
	unlink /tmp/sencha.zip  && \
	chmod o+x /tmp/SenchaCmd-7.2.0.84-linux-amd64.sh && \
	/tmp/SenchaCmd-7.2.0.84-linux-amd64.sh -q -dir /opt/Sencha/Cmd/7.2.0.84 && \
	unlink /tmp/SenchaCmd-7.2.0.84-linux-amd64.sh && 
    
WORKDIR /app