#!../../bin/rhel6-x86_64/matlabSupport

# tag log messages with IOC name
epicsEnvSet(LINAC_SECTOR,"ML00")
epicsEnvSet(ACCELERATOR,"smurf")
epicsEnvSet(SYSTEM,"SMRF")
epicsEnvSet(IOC_DAEMON_NUMBER,"0")

# Add in the photon gateway
#< /usr/local/lcls/epics/iocCommon/facility/soft_pre_st_add_photon_gateway.cmd

# Source envPaths
< envPaths

# Change directory to TOP of application
cd(${TOP})

# Override env, if necessary
< iocBoot/common/envVars.cmd

# Show the EPICS environment setup
epicsEnvShow()
# Done with epicsEnvShow()

## Register all support components
dbLoadDatabase("dbd/matlabSupport.dbd")
matlabSupport_registerRecordDeviceDriver(pdbbase)

## Load common databases
< iocBoot/common/loadDBs.cmd

## Setup archive
< iocBoot/common/setupArchive.cmd

## Setup autosave/restore
< iocBoot/common/setupAutosave.cmd

## iocAdmin
< iocBoot/common/setupIOCAdmin.cmd

## Restore datasets
< iocBoot/common/restore.cmd

## Note that autosave/restore spews a lot of messages and message
## throttling throttles all of the seq messages below.

iocInit()

## Start logging messages before starting sequences.
< iocBoot/common/startLogging.cmd

## Start any sequence programs
#
# For Heinz-Dieter
#
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO101"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO102"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO103"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO104"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO105"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO106"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO107"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO108"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO109"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO110"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO111"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO112"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO113"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO114"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO115"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO116"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO118"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO117"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO119"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO120"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO121"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO122"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO123"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO124"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO125"
#
# Mike's test pvs
#
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO199"
#seq ChangeLogger,"pv=SIOC:SYS0:ML00:AO200"

## Start saving datasets
< iocBoot/common/startAutosave.cmd

