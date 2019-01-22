## iocAdmin
epicsEnvSet("ENGINEER","Mike Zelazny x3673")
epicsEnvSet("LOCATION","${ACCELERATOR}-daemon${IOC_DAEMON_NUMBER}")
epicsEnvSet("STARTUP","/usr/local/${ACCELERATOR}/epics/iocCommon/${IOC}")
epicsEnvSet("ST_CMD","startup.cmd")
dbLoadRecords("db/iocAdminSoft.db","IOC=SIOC:${SYSTEM}:${LINAC_SECTOR}")
dbLoadRecords("db/iocRelease.db","IOC=SIOC:${SYSTEM}:${LINAC_SECTOR}")
