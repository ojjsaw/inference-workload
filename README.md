# inference-workload

* public mobilenet-ssd caffemodel from open model zoo
* Coverted to FP32 IR for inference
* Accuracy-aware quanitization INT8 using Post-Training Optimization Tool.

> Run devcloud.intel.com tutorials/pot notebook for above steps.

| Metric | FP32 | INT8 |
| :---: | :---: | :---: |
| Accuracy | 79.40% | 79.38% |

### Build locally
```
docker build -t test-container:latest .
```

### Run locally by mounting directory
```
docker run --rm -e PRECISION=INT8 -v ${PWD}/tmp:/home/openvino/data test-container:latest
```