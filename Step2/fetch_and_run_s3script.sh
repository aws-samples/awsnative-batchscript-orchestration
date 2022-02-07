// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

#!/bin/sh
PATH="/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
if [ -z "${BATCH_FILE_S3_URL}" ]; then
  usage "BATCH_FILE_S3_URL not set. No object to download."
fi
scheme="$(echo "${BATCH_FILE_S3_URL}" | cut -d: -f1)"
if [ "${scheme}" != "s3" ]; then
  usage "BATCH_FILE_S3_URL must be for an S3 object; expecting URL starting with s3://"
fi

# Standard function to print an error and exit with a failing return code
error_exit () {
  echo "${BASENAME} - ${1}" >&2
  exit 1
}
# Create a temporary directory to hold the downloaded contents, and make sure
# mktemp arguments are not very portable.  We make a temporary directory with
# portable arguments, then use a consistent filename within.
TMPDIR="$(mktemp -d -t tmp.XXXXXXXXX)" || error_exit "Failed to create temp directory."
TMPFILE="${TMPDIR}/batch-file-temp"
install -m 0600 /dev/null "${TMPFILE}" || error_exit "Failed to create temp file."

# Create a temporary file and download the script
aws s3 cp "${BATCH_FILE_S3_URL}" - > "${TMPFILE}" || error_exit "Failed to download S3 script."

#Make the temporary file executable and run it with any given arguments
local script="./${1}"; shift
chmod u+x "${TMPFILE}" || error_exit "Failed to chmod script."
exec ${TMPFILE} "${@}" || error_exit "Failed to execute script."

