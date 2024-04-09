# JMusicbot Dockerfile

Original repository: https://github.com/jagrosh/MusicBot

Original creator: jagrosh

Current version: 0.4.0

**Thanks to jagrosh for his amazing bot!**

## Usage 

* Put all your config files into ``/path/to/config/folder``.
* The ``serversettings.json`` volume mount is neccessary, as the serversettings json is in the run directory, not the config folder

For a normal start, use that.
```
docker run -dt \  
  --name=jmusicbot \  
  -e APP_ENV=docker \
  -v /path/to/config/folder:/usr/src/musicbot/config \
  -v /path/to/config/folder/serversettings.json:/usr/src/musicbot/serversettings.json \
  --restart=always \
  nfxus/jmusicbot
```

If you want to use ``docker-compose``, use that.
```
version: "3"
services:
  jmusicbot:
    container_name: jmusicbot
    environment:
      - APP_ENV=docker
    image: nfxus/jmusicbot:latest
    restart: always
    volumes:
      - /path/to/config/folder:/usr/src/musicbot/config
      - /path/to/config/folder/serversettings.json:/usr/src/musicbot/serversettings.json
```
