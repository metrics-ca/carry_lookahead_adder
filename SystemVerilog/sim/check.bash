#!/bin/bash
result="Passed" && `grep -c "Test: PASSED" dsim.log > /dev/null` || result="Failed"
echo "{ summary: $result, time : 2 }" > results.json