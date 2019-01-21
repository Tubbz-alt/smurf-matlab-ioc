#!/usr/bin/env bash

# Look to the tar.gz file with the source code
# This should come from git instead
num_tar_files=$(find . -name '*.tar.gz' | wc -l)

# Check if the file was found
if [[ ${num_tar_files} -eq 0 ]]; then
    echo "No tar.gz file found. Aborting..."
    exit 1
fi

# Check if more than one file was found
if [[ $num_tar_files -gt 1 ]]; then
    echo "More than one tar.gz file found. Aborting..."
    exit 2
fi

# Extract the application version from the tarball name
app_version=$(basename -- `find . -name '*.tar.gz'`)
app_version=${app_version%%.*}

# Build the docker and tagged it with the application version
docker build --build-arg APP_VERSION=${app_version} -t jesusvasquez333/smurf-matlab-ioc .
docker tag jesusvasquez333/smurf-matlab-ioc jesusvasquez333/smurf-matlab-ioc:${app_version}
