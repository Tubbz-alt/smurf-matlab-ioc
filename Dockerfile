# Create the builder image
FROM jesusvasquez333/smurf-epics-slac:R1.0.0 as builder
# App version (passed as --build-arg)
ARG APP_VERSION
# Build the app in /root
WORKDIR /root
# Copy the application source code (this should come from git)
ADD ${APP_VERSION}.tar.gz .
WORKDIR ${APP_VERSION}
# Add the RELEASE_SITE file for the container environment
ADD RELEASE_SITE .
# Build the application
RUN make distclean && make

# Create the final image
FROM centos:6.10
## EPICS CONFIGURATIONS (should come from builder)
ENV EPICS_CA_REPEATER_PORT 5065
ENV EPICS_CA_AUTO_ADDR_LIST YES
ENV EPICS_CA_SERVER_PORT 5064
ENV IOC_DATA /data/epics/ioc/data
# App version (passed as --build-arg)
ARG APP_VERSION
# Name if the IOC were are running in the container
# (defaults to sioc-smrf-ml00, cab be changed using --build-arg)
ARG IOC_NAME=sioc-smrf-ml00
# Copy the IOC produced during the building stage
COPY --from=builder /root/${APP_VERSION} /root/${APP_VERSION}
# Go to the IOC top level
WORKDIR /root/${APP_VERSION}/iocBoot/${IOC_NAME}
# Start the IOC by default
CMD ["./st.cmd"]
