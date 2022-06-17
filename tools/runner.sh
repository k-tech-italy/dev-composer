#!/bin/bash -e

if [ "$*" = "restart" ]; then
  docker stop gitlab-runner
  docker start gitlab-runner
elif [ "$*" = "register" ]; then
  docker run --rm -it -v ${RUNNER_DATA_DIR}/etc/gitlab-runner:/etc/gitlab-runner gitlab/gitlab-runner register
  echo "Remember to open ${RUNNER_DATA_DIR}/etc/gitlab-runner/config.toml and replace "
  echo "   volumes = [\"/cache\"]"
  echo "   with"
  echo "   volumes = [\"/cache\", \"/var/run/docker.sock:/var/run/docker.sock\"]"
elif [ "$*" = "" ]; then
  echo "Usage:"
  echo "  $0 restart # to restart the docker"
  echo "  $0 register # to register the runner"
else
  #docker exec gitlab-runner gitlab-runner $*
  docker run --rm -it -v `pwd`:/mnt -v ${RUNNER_DATA_DIR}/etc/gitlab-runner:/etc/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner $*
fi
