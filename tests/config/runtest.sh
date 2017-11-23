#!/bin/sh -e
export TMP_RUNDIR=`mktemp -d`
function finish {
  rm -rf ${TMP_RUNDIR}
}
trap finish EXIT

echo "config-test: ${2}"
cp tests/config/${2}/* ${TMP_RUNDIR}/
cp tests/config/test_utils.lua ${TMP_RUNDIR}/
TEST=1 ${1} -f 1 -c test.cfg ${TMP_RUNDIR}