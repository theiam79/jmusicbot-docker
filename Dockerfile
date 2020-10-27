FROM openjdk:8u212
WORKDIR /usr/src/musicbot
RUN apt-get update && apt-get upgrade -y \
    && apt install -y curl wget \ 
    && VERSION=$(curl --silent "https://api.github.com/repos/jagrosh/MusicBot/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")') \
    && wget "https://github.com/jagrosh/MusicBot/releases/download/$VERSION/JMusicBot-$VERSION.jar" -O /usr/src/musicbot/JMusicBot.jar
VOLUME /usr/src/musicbot/config
ENV APP_ENV=docker
CMD ["java", "-Dconfig=/usr/src/musicbot/config/config.txt", "-Dnogui=true" , "-jar", "JMusicBot.jar"]
