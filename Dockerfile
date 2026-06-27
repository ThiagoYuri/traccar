FROM eclipse-temurin:21-jre

WORKDIR /opt/traccar

# Ferramentas necessárias
RUN apt-get update && \
    apt-get install -y curl unzip && \
    rm -rf /var/lib/apt/lists/*

# Baixa Traccar
RUN curl -L https://github.com/traccar/traccar/releases/latest/download/traccar-other-6.10.zip \
    -o traccar.zip && \
    unzip traccar.zip && \
    rm traccar.zip

# Persistência
VOLUME ["/opt/traccar/data"]

EXPOSE 8082
EXPOSE 5000-5150

CMD ["java", "-jar", "/opt/traccar/tracker-server.jar"]