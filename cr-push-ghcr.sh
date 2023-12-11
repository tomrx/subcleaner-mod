#!/bin/bash

# Create a token for pushing packages here:
# https://github.com/settings/tokens/new?scopes=write:packages
export CR_USER="$1"
export CR_TOKEN="$2"
export CR_PACKAGE="$3"
if [[ -z "$3" ]]; then
        echo $0 USER TOKEN PACKAGE
        exit 1
fi

echo $CR_TOKEN | docker login ghcr.io -u "$CR_USER" --password-stdin

docker build . -t "ghcr.io/${CR_USER}/${CR_PACKAGE}"
docker push "ghcr.io/${CR_USER}/${CR_PACKAGE}"
