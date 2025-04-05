FROM eclipse-temurin:latest
ARG CACHEBUST=1
WORKDIR /opt/
RUN apt-get update
RUN apt-get install -y git netcat-traditional
ADD https://api.github.com/repos/rtemelcea/Lavalink/git/refs/heads/main version.json
RUN git clone -b main https://github.com/rtemelcea/Lavalink.git lavalink
EXPOSE 2333
WORKDIR /opt/lavalink/
CMD ["java", "-jar", "-Djdk.tls.client.protocols=TLSv1.2", "/opt/lavalink/lavalink.jar"]
