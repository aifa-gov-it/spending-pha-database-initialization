# Spending PHA Database initialization scripts

This is a set of scripts to setup Spending PHA database schemas. Any change not recorded here will not be considered as valid.

## Run a Dockerized Oracle Database Instance

### Dependencies

- Docker 1.12+

### How to run

1. Login to the Oracle Container Registry:

  ```
  docker login container-registry.oracle.com
  ```

1. Run an Oracle Database Enterprise Edition instance:

  ```
  $ docker run -d --env-file <path_to_env_file> -p <listener_port>:1521 -p <http_port>:5500 -it --name <container_name> --shm-size="<shared_memory_size>" <image_name>

  Parameters:
     <path_to_env_file> is the path to the environment file you created using above example.
     <listener_port> is the port on host machine to map the container's 1521 port (listener port).
     <http_port> is the port on host machine to map the container's 5500 port (http service port).
     <container_name> is the container name you want to create.
     <shared_memory_size> is the memory size for the container to run. The minimum requirement is 4GB (--shm-size="4g").
     <image_name> is the image that you use to create a container.
  ```

  Where env-file is a file with the following contents (example):

  ```
  ####################################################################
  ## Copyright(c) Oracle Corporation 1998,2016. All rights reserved.##
  ##                                                                ##
  ##                   Docker OL7 db12c dat file                    ##
  ##                                                                ##
  ####################################################################

  ##------------------------------------------------------------------
  ## Specify the basic DB parameters
  ##------------------------------------------------------------------

  ## db sid (name)
  ## default : ORCL
  ## cannot be longer than 8 characters

  DB_SID=OraDoc

  ## db passwd
  ## default : Oracle

  DB_PASSWD=MyPasswd123

  ## db domain
  ## default : localdomain

  DB_DOMAIN=my.domain.com

  ## db bundle
  ## default : basic
  ## valid : basic / high / extreme
  ## (high and extreme are only available for enterprise edition)

  DB_BUNDLE=basic

  ## end
  ```

  So an example command looks like:

  ```
  docker run -d --env-file ./db_env.dat -p 1527:1521 -p 5507:5500 -it --name dockerDB --shm-size="8g" container-registry.oracle.com/database/enterprise
  ```

  If you want to access the container, use docker exec:

  ```
  $ docker exec -it <container_name> /bin/bash
  Where <container_name> is the container name you want to get into. Once you are in, you are running as root user. Use “su - oracle” to run as oracle user. To exit of container, use “exit” just like a regular ssh connection.
  ```

  The first database setup takes about 5 to 8 minutes. Logs are kept under /home/oracle/setup/log. To check whether the database setup is successful, check the log file “/home/oracle/setup/log/setupDB.log“. If “Done ! The database is ready for use .” is shown, the database setup was successful.

  The restart of container takes less than 1 minute just to start the database and its listener. The startup log is “/home/oracle/setup/log/startupDB.log”
