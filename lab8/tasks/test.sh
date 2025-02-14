#!/bin/bash
set -uo pipefail
set +e

FAILURE=false

./training/tests/test_run_experiment.sh || FAILURE=true
pytest -v --junitxml=../test-reports/unit-testresults.xml . || FAILURE=true

if [ "$FAILURE" = true ]; then
  echo "Tests failed"
  exit 1
fi
echo "Tests passed"
exit 0
