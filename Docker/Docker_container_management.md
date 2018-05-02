# Container Management

This section describes some commands that allows to manage the docker containers.

## List containers

This section describes the commands that allows to list containers in a variety ways.

* To lists all running containers execute:

        $ docker container ls

* To lists all containers execute:

        $ docker container ls -a

## Create, run and get inside the containers
	
This section describes the commands that allows to create, run and get inside the containers in a variety ways. Nginx and mysql server are used as an example in this section.

* To create a new nginx server container that listen the host port 80 and route the http traffic, from the host, to container port 80.

        $ docker container run --publish 80:80 nginx

* To create a new nginx server container that listen the host port 80 and route the http traffic, from the host, to container port 80.

        $ docker container run --publish 80:80 --detach nginx

  >Note:
  >* The **--detach command** tells docker to run the container in the background. 

* Create a new nginx server container that listen the host port 80 and route the http traffic, from the host, to container port 80.

        $ docker container run --publish 80:80 --detach --name webhost nginx 

  >Note:
  >* The **--detach command** tells docker to run the container in the background.
  >* The **--name command** allows to set a name for the container.

* Create a new mysql database container.

        $ docker container run -detach --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=true -v mysql-db:/var/lib/mysql mysql

  >Note:
  >* The **--detach command** tells docker to run the container in the background.
  >* The **--name command** allows to set a name for the container.
  >* The **-e command** allows to pass the values for environment variables.
  >* The **-v command** allows to give a name for the volume created to store the data
mysql-db is the volume name.
/var/lib/mysql is the directory where the container volume is.

* Create a new nginx server container.

        $ docker container run -it --name proxy nginx bash 

  >Note:
  >* The **-t command** simulates a real terminal, a pseudo-tty (pseudo text input/output environment), like what SSH does. 
  >* The **-i command** keep the session open to receive terminal input. 
  >* The bash parameter, if runned with with **-it command**, will give the user a terminal inside the running container. 
  >* Once the user is in the shell, inside the container, and hit the exit command to exit the shell, the container stop running.
  >* It’s important to say that the run command will only open the bash program if the container has bash installed in it.

## Start, stopping and get inside the containers

This section describes the commands that allows to start and stop containers previously created.

* Starts a container previously created. 

        $ docker container start <container name>

  >Note:
  >* Replace **container name** with the container name that you want to start.

* Starts a container previously created. 

        $ docker container start -ai <container name>

  >Note:
  >* Replace **container name** with the container name that you want to start.
  >* The **-ai** open the terminal inside the container.
  >* Once the user is in the shell, inside the container, and hit the exit command to exit the shell, the container stop running.

* Stop container based on the container id. 

        $ docker container stop <container name> <container name> …

  >Note:
  >* Replace **container name** with the container name that you want to stop.

* Run additional commands in existing container.

        $ docker container exec -it <container name> <program name to be runned>

  >Note 1:
  >* The **exec command** allows to execute programs inside the container. 
  > For example, if the user has a MYSQL container and needs to access the MYSQL shell to do some administrative stuff on the MYSQL itself.

  >Note 2:
  > * The **-t command** simulates a real terminal, a pseudo-tty (pseudo text input/output environment), like what SSH does. 
  >* The **-i command** keep the session open to receive terminal input.
  >* Replace **container name** with the container name that you want to execute the command inside.
  >* Replace **program name to be runned** with the program name that you want to execute inside the container. For example, the bash parameter, if runned with with -it command, will give the user a terminal inside the running container. 
  >* Once the user is in the shell, inside the container, and hit the exit command to exit the shell, the container does not stop running.
  > *It’s important to say that the exec command will only open the bash program if the container has bash installed in it.

##  Remove containers
	
This section describes the commands that allows to remove containers.

* Remove one or more containers based on the container id. 

        $ docker container rm <container id/name> <container id/name> … 

  >Note:
  >* Replace **container id/name** with the container id or container name that you want to remove.

* Remove one or more containers based on the container id even if the container is active and running.

        $ docker container rm -f <container id/name>

>Note:
>* Replace **container id/name** with the container id or container name that you want to remove.

## Update containers configuration
	
This section describes the commands that allows to update the configuration of the containers.

* Update configuration of one or more containers.

        $ docker update [options] <container name> <container name…>

  >Note:
  >* This command allows to update running containers without having to kill it or restart it.
  >* Almost all options are related to limiting and controlling resource usage for the containers.

##  Inspecting the containers behavior
	
This section describes the commands that allows to inspect the behavior of the containers.

* Display detailed configuration of one or more containers. 

        $ docker container inspect <container name> …

>Note:
>* Replace **container name** with the container name that you want to see the specific configuration.

* Display the IP configuration of the container.

        $ docker container inspect --format '{{ .NetworkSettings.IPAddress }}' <container name>

  >Note:
  >* The **--format command** is a common option for formatting the output commands of commands using “Go templates”.
  >* Replace **container name** with the container name that you want to see the specific configuration (the IP address in this case). 
  >* To get the complete list of the available format templates check this link out.

* Shows the container log events. 

        $ docker container logs <container name>

  >Note:
  >* Replace **container name** with the container name that you want to see the logs.

* Shows in a easy format which ports are forwarding traffic from the host into the container itself.

        $ docker container port <container name> 

  >Note:
  >* Replace **container name** with the container name that you want to see the port configuration.

* Shows live performance data for all containers.

        $ docker container stats

* Shows the running process inside the container. 

        $ docker container top <container name> 

  >Note:
  >* Replace **container name** with the container name that you want to see the running process inside the container.

## Network

This section describes the commands that allows to inspect the behavior of the network in the docker context.

* Attach a network to container.

        $ docker network connect <network name> <container name>

  >Note:
  >* Replace **network name** with the network name that you want to put to container.
  >* Replace **container name** with the container name that you want to connect inside the network.

* Creates a virtual network locally with its own subnet somewhere around the 172.17 and above, because it will increment as it goes. So, 17, then 18, 19, 20 and so on.

        $ docker network create <network name>

  >Note:
  >* Replace **network name** with the network name that you want to create.

* Create a network.

        $ docker network create --driver

* Detach a network to container.

        $ docker network disconnect <network name> <container name>

  >Note:
  >* Replace **network name** with the network name that you want to put to container.
  >* Replace **container name** with the container name that you want to connect inside the network.

* Inspect a network.

        $ docker network inspect <network name>

  >Note:
  >* Replace **network name** with the network name that you want to put to container.

* Show networks.

        $ docker network ls

## Volume Management

This section describes the commands that allows to manage the containers volumes.

* Lists the volumes.
      
        $ docker volume ls

* Shows detailed information about a specific volume.

        $ docker volume inspect <volume id/name>

  >Note:
  >* Replace **volume id/name** with the volume id or volume name that you want to get the information.

## Docker Compose

* Stop all containers and remove containers, volumes and networks.

        $ docker-compose down

* Shows the log for the containers listed in the compose file.

        $ docker-compose log

* Setup volumes, networks and start all containers

        $ docker-compose up

* Setup volumes, networks and start all containers.
  
        $ docker-compose up -d
      
  >Note:
  >* The containers will be started in background.


