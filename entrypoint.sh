#!/bin/bash

source /opt/intel/openvino/bin/setupvars.sh

# directory for results
mkdir -p /home/openvino/data/FP16

# run benchmark app
OUTPUT=`/opt/intel/openvino/deployment_tools/tools/benchmark_tool/benchmark_app.py \
    -m "intel/person-detection-retail-0013/$PRECISION/person-detection-retail-0013.xml" \
    -api sync \
    -niter 500 \
    -report_type detailed_counters \
    -report_folder "/home/openvino/data"`

# display on dashboard
echo "$OUTPUT" | tail -n2 > /home/openvino/data/FP16/performance.txt

# print log
echo "$OUTPUT"


