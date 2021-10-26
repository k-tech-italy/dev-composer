#!/bin/bash

CURRENT_UID=`id -u`
CURRENT_GID=`id -g`

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"


export $(awk '$1 ~ /^[^;#]/' $SCRIPT_DIR/.env | grep DEVC_SERVICES | xargs)

IFS=, read -r -a DEVC_SERVICES <<<"$DEVC_SERVICES"

SERVICES=""

for service in "${DEVC_SERVICES[@]}"; do
  SERVICES+="$SERVICE -f docker-compose-$service.yml";

done
SERVICES="docker-compose --project-directory $SCRIPT_DIR $SERVICES $*"

echo "Will run:"
echo "  $SERVICES"
echo "from $SCRIPT_DIR"
(
    cd $SCRIPT_DIR
    `$SERVICES`
)
