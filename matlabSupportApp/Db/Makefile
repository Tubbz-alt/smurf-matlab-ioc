TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install)
# databases, templates, substitutions
#
DB += matlabAOSupport.db
DB += matlabFWFSupport.db
DB += matlabSOSupport.db
DB += matlabCASupport.db
DB += matlabCALCSupport.db
DB += matlabAGESupport.db

DB_INSTALLS += $(IOCADMIN)/db/iocAdminSoft.db 
DB_INSTALLS += $(SNCSEQ)/db/devSeqCar.db
IOCRELEASE_DB += iocRelease.db

DB_INSTALLS += $(AUTOSAVE)/db/save_restoreStatus.db

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_TEMPLATE = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

