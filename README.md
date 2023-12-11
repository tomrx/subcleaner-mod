# Subcleaner
Subcleaner is a python3 script for removing ads from .srt subtitle files.
The script is more sophisticated than a simple search and delete per line
and uses different regex profiles for different languages.
Once the script have identified ad-blocks they get removed and the remaining blocks 
get re-indexed.

Can clean entire libraries in recursive mode and works well with [Bazarr](https://github.com/morpheus65535/bazarr) 
directly installed or as a container from the [linuxserver/bazarr](https://hub.docker.com/r/linuxserver/bazarr) image.

# Installing
Add the following environment variable to docker-compose.yml:

    environment:
      DOCKER_MODS: ghcr.io/tomrx/subcleaner-mod:latest
      
## Bazarr
Unlock the script's full potential by running it after downloading a subtitle from 
[Bazarr](https://github.com/morpheus65535/bazarr). Enable custom post-processing and use
the command (note the quotation):

    python3 /opt/subcleaner/subcleaner.py "{{subtitles}}" -s

It should work right out the gate provided the paths and permissions are set up correctly.

in the bazarr log it should confirm that the script ran successfully or give you 
an error message that tells you what's wrong. If nothing is output then you've probably 
set the script path wrong.
