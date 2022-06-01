#!/bin/sh
# Replacement for runtests, used by parallel-test.diff

printf "\n%-40s running\n" $1
if bash -c "set -o pipefail; $1 2>&1 | tee $1.log | awk '{printf \".\"; fflush() }'" 2>/dev/null
then
	printf "\n%-40s PASS\n" $1
else
	printf "\n%-40s FAIL; Output:\n" $1
	cat $1.log
	exit 1
fi
