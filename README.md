# Deploy services  
Deploy services on local machine 

## Requirements
* [Direnv](https://direnv.net) 
* [Docker](https://docs.docker.com/engine/install/) 
* [Docker compose](https://docs.docker.com/compose/install/linux/) 
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) 

Edit the .env files and set the following variables:
| Var   | Required | Desc |
| ------- | ------- | ----------- |
| ``DEVC_SERVICES``       | `yes`       | set the service needed (`postgres,redis,minio,devpi,seleniumhub,sqs,pgadmin,sentry,registry`)  |
| ``POSTGRES_PORT`` | `yes`        | set postgres port |
| ``POSTGRES_PASSWORD`` | `yes`        | set postgres password |
| ``SENTRY_EMAIL_PASSWORD`` | `yes`        | set sentry password |
| ``SENTRY_EMAIL_USER`` | `yes`        | set sentry user |
| ``SENTRY_SECRET_KEY`` | `yes`        | set sentry secret key|
| ``DEVPI_ROOT_PORT``  | `yes`  | set devpi root port|
| ``DEVPI_ROOT_PWD``  | `yes`  | set devpi root password |

### Deploy components
* Configure .env
* Create .envrc from .envrc.example
* Launch dc.sh


```
./dc.sh <command>

```

Commands:
* build              Build or rebuild services
* bundle             Generate a Docker bundle from the Compose file
* config             Validate and view the Compose file
* create             Create services
* down               Stop and remove containers, networks, images, and volumes
* events             Receive real time events from containers
* exec               Execute a command in a running container
* help               Get help on a command
* images             List images
* kill               Kill containers
* logs               View output from containers
* pause              Pause services
* port               Print the public port for a port binding
* ps                 List containers
* pull               Pull service images
* push               Push service images
* restart            Restart services
* rm                 Remove stopped containers
* run                Run a one-off command
* scale              Set number of containers for a service
* start              Start services
* stop               Stop services
* top                Display the running processes
* unpause            Unpause services
* up                 Create and start containers
* version            Show the Docker-Compose version information