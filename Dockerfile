FROM java:8
WORKDIR /usr/src/musicbot
RUN VERSION=$(curl --silent "https://api.github.com/repos/jagrosh/MusicBot/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")') \
    && wget "https://github.com/jagrosh/MusicBot/releases/download/$VERSION/JMusicBot-$VERSION-Linux.jar" -O /usr/src/musicbot/JMusicBot.jar
VOLUME /usr/src/musicbot/config
ENV APP_ENV=docker
CMD ["java", "-Dconfig=/usr/src/musicbot/config/config.txt", "-jar", "JMusicBot.jar", "-nogui=true"]
