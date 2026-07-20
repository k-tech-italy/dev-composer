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

DOCKER_COMPOSE_CMD=$(grep "^DOCKER_COMPOSE_CMD"  ${SCRIPT_DIR}/.env | cut -d = -f 2)

cd ${SCRIPT_DIR} && ${DOCKER_COMPOSE_CMD} --project-directory ${SCRIPT_DIR} --env-file ${SCRIPT_DIR}/.env -f ${SCRIPT_DIR}/docker-compose-local.yml $*