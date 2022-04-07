#!/bin/bash
set -uo pipefail
set +e

FAILURE=false

./training/tests/test_run_experiment.sh || FAILURE=true
pytest -v -rs . --html=report.html --self-contained-html test_Suite.py || FAILURE=true

if [ "$FAILURE" = true ]; then
  echo "Tests failed"
  exit 1
fi
echo "Tests passed"
exit 0
