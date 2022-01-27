#!/bin/bash

source /opt/intel/openvino/bin/setupvars.sh

# directory for results
mkdir -p /home/openvino/data/FP16

# /opt/intel/openvino/deployment_tools/tools/benchmark_tool/benchmark_app.py \
#     -m "intel/person-detection-retail-0013/FP16-INT8/person-detection-retail-0013.xml" \
#     -api sync \
#     -niter 1000 \
#     -report_type detailed_counters \
#     -report_folder "/home/openvino/data" > output.txt

# run benchmark app
OUTPUT=`/opt/intel/openvino/deployment_tools/tools/benchmark_tool/benchmark_app.py \
    -m "intel/person-detection-retail-0013/FP16-INT8/person-detection-retail-0013.xml" \
    -api sync \
    -niter 10 \
    -report_type detailed_counters \
    -report_folder "/home/openvino/data"`

# display on dashboard
echo "$OUTPUT" | tail -n2 > /home/openvino/data/FP16/performance.txt

# print log
echo "$OUTPUT"


