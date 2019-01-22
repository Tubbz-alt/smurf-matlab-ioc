# Create the builder image
FROM jesusvasquez333/smurf-epics-slac:R1.0.0 as builder

# Prepare the build directory
RUN mkdir -p /root/MatlabSupport
WORKDIR /root/MatlabSupport
# Copy the source code
ADD . .
# Build the application
RUN make distclean && make

# Create the final image
FROM centos:6.10
## EPICS CONFIGURATIONS (should come from builder)
ENV EPICS_CA_REPEATER_PORT 5065
ENV EPICS_CA_AUTO_ADDR_LIST YES
ENV EPICS_CA_SERVER_PORT 5064
ENV IOC_DATA /data/epics/ioc/data
# Name if the IOC were are running in the container
# (defaults to sioc-smrf-ml00, cab be changed using --build-arg)
ARG IOC_NAME=sioc-smrf-ml00
# Copy the IOC produced during the building stage
COPY --from=builder /root/MatlabSupport /root/MatlabSupport
# Go to the IOC top level
WORKDIR /root/MatlabSupport/iocBoot/${IOC_NAME}
# Start the IOC by default
CMD ["./st.cmd"]
