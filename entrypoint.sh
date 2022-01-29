#!/bin/bash

source /opt/intel/openvino/bin/setupvars.sh

# directory for results
mkdir -p /home/openvino/data/FP16

if [ "$PRECISION" == "FP32" ]
then
    # run benchmark app
    OUTPUT=`/opt/intel/openvino/deployment_tools/tools/benchmark_tool/benchmark_app.py \
        -m "mobilenet-ssd/FP32/mobilenet-ssd_FP32.xml" \
        -d $DEVICE \
        -api $API \
        -niter $ITERATIONS \
        -report_type detailed_counters \
        -report_folder "/home/openvino/data"`
elif [ "$PRECISION" == "INT8" ]
then
    # run benchmark app
    OUTPUT=`/opt/intel/openvino/deployment_tools/tools/benchmark_tool/benchmark_app.py \
        -m "mobilenet-ssd/INT8/intermediate_model.xml" \
        -d $DEVICE \
        -api $API \
        -niter $ITERATIONS \
        -report_type detailed_counters \
        -report_folder "/home/openvino/data"`
else
    OUTPUT="Use only FP32 or INT8 precisions."
fi

# display on dashboard
echo "$OUTPUT" | tail -n2 > /home/openvino/data/FP16/performance.txt

# print log
echo "$OUTPUT"


