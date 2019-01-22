## Setup autosave/restore
set_requestfile_path("${IOC_DATA}/${IOC}/autosave-req")
set_savefile_path("${IOC_DATA}/${IOC}/autosave")

save_restoreSet_status_prefix("SIOC:${SYSTEM}:${LINAC_SECTOR}:")
dbLoadRecords("db/save_restoreStatus.db", "P=SIOC:${SYSTEM}:${LINAC_SECTOR}:")

