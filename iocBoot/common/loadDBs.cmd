## Load databases
dbLoadRecords("db/matlabAOSupport.db","SYSTEM=${SYSTEM},MICRO=${LINAC_SECTOR}")
dbLoadRecords("db/matlabFWFSupport.db","SYSTEM=${SYSTEM},MICRO=${LINAC_SECTOR}")
dbLoadRecords("db/matlabSOSupport.db","SYSTEM=${SYSTEM},MICRO=${LINAC_SECTOR}")
dbLoadRecords("db/matlabCASupport.db","SYSTEM=${SYSTEM},MICRO=${LINAC_SECTOR}")
dbLoadRecords("db/matlabCALCSupport.db","SYSTEM=${SYSTEM},MICRO=${LINAC_SECTOR}")
dbLoadRecords("db/matlabAGESupport.db","SYSTEM=${SYSTEM},MICRO=${LINAC_SECTOR}")
dbLoadRecords("db/devSeqCar.db","SIOC=SIOC:${SYSTEM}:${LINAC_SECTOR}")
