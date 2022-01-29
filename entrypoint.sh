#!/bin/bash
source /opt/intel/openvino/bin/setupvars.sh

# mount dir for results
mkdir -p /home/openvino/data/FP16

# default FP32
MODEL_PATH="mobilenet-ssd/FP32/mobilenet-ssd_FP32.xml"
if [ "$PRECISION" == "INT8" ] 
then
    MODEL_PATH="mobilenet-ssd/INT8/intermediate_model.xml"
fi

# run python benchmark app
OUTPUT=`/opt/intel/openvino/deployment_tools/tools/benchmark_tool/benchmark_app.py \
    -m $MODEL_PATH \
    -d $DEVICE \
    -api $API \
    -niter $NITER \
    -report_type detailed_counters \
    -report_folder "/home/openvino/data"`

# display metrics on dashboard and print
echo "$OUTPUT" | tail -n2 > /home/openvino/data/FP16/performance.txt
echo "$OUTPUT"