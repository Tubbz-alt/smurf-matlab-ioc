# SLAC's Matlab support IOC Docker image for the SMuRF project

## Description

This docker image, named **smurf-matlab-ioc** contains the SLAC's Matlab support IOC.

It is based on centos 6.10, and the IOC application is build using the *smurf-epics-slac* image, which contains all the SLAC's packages, EPICS base, and EPICS modules need to build this IOC.

The name of the IOC used in this project is **sioc-smrf-ml00**.

## Source code

The IOC source code was taken from SLAC's version, hosted in an internal CVS repository.

The code was manually checkout from CVS (tagged version **MatlabSupport-R4-2-3**), cleaned (removed references to CVS, cram, and SLAC's IOCs), and copied into this repository.

## Building the image

The provided script *build_docker.sh* will automatically build the docker image. It will tag the resulting image using the same git tag string (as returned by `git describe --tags --always`).

## Running the container

As any IOC at SLAC, this IOC need to a data directory where it will read and write its configuration setting (like for example autosave, iocAdmin, etc.). Inside the container, this IOC data directory is located in

```
/data/epics/ioc/data/sioc-smrf-ml00
```

You should have this directory in your host CPU, and map it to */data/* inside the container.

You also need to publish the EPIC channel access ports (tcp and udp ports 5064, 5065 by default) to the host if you want external clients to have access to the IOC's PVs. (**Note**: Other containers running in the same host will have access to these ports even if they are not published to the host).

When the container is started, by default the IOC is started inside it.

The container can be run in two ways: in the foreground or in the background.

### Run the container in the foreground

You can start the container in the foreground with this command

```
docker run -ti --rm --name smurf-matlab-ioc \
-v <LOCAL_DATA_PATH>:/data \
-p 5064:5064 -p 5065:5065 -p 5064:5064/udp -p 5065:5065/udp \
jesusvasquez333/smurf-matlab-ioc:<VERSION>
```

Where:
- **<LOCAL_DATA_PATH>**: is the absolute path of the root of the IOC data directory in the host local disk. For example, if in the host this directory is `/data/epics/ioc/data/sioc-smrf-ml00`, then **<LOCAL_DATA_PATH>** = **/data**
By default the container will start the IOC.
- **<VERSION>**: is the tagged version of the container your want to run.

### Run the container in the background

You can start the container in the background with this command

```
docker run -tid --rm --name smurf-matlab-ioc \
-v <LOCAL_DATA_PATH>:/data \
-p 5064:5064 -p 5065:5065 -p 5064:5064/udp -p 5065:5065/udp \
jesusvasquez333/smurf-matlab-ioc:<VERSION>
```

Where the parameters are the same explained in the previous case.

### Checking the status of the container

You can check the status of running containers with the `docker ps` command. It will list the containers that are running at the moment.

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
163326dec993        smurf-matlab-ioc    "./st.cmd"          31 seconds ago      Up 30 seconds                           awesome_raman
```

### Attaching to the container running in the background

You can attached to the container with the command `docker attach matlab_ioc`. And you can detach again pressing `CRTL+p` followed by `CRTL+q`.

### Stop and container

You can stop the container with the command `docker stop smurf-matlab-ioc`.