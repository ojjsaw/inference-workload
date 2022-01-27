# inference-workload

```
docker build -t test-container:latest .
```

```
docker run -it --rm -v ${PWD}:/app openvino/ubuntu20_dev_no_samples:2021.4.2
```

```
docker run --rm -v ${PWD}:/home/openvino/data test-container:latest
```