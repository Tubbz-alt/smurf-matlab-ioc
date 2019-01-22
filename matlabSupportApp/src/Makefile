TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#========================================

#===============================
# build Matlab Support Soft IOC
#===============================

PROD_IOC_Linux = matlabSupport
DBD += matlabSupport.dbd

matlabSupport_SRCS += matlabSupport_registerRecordDeviceDriver.cpp
matlabSupport_SRCS_DEFAULT += matlabSupportMain.cpp
matlabSupport_SRCS_vxWorks += -nil-

matlabSupport_SRCS += ChangeLogger.st

matlabSupport_LIBS += seq seqCar pv devIocStats autosave calc sscan qsrv

matlabSupport_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
matlabSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#========================================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

