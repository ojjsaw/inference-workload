FROM openvino/ubuntu20_dev_no_samples:2021.4.2

# FP32/INT8 | sync/async | ITERATIONS n | CPU/GPU
ENV PRECISION=FP32 API=sync NITER=500 DEVICE=CPU 

WORKDIR /home/openvino/app
COPY entrypoint.sh .
COPY mobilenet-ssd mobilenet-ssd/.

ENTRYPOINT [ "/home/openvino/app/entrypoint.sh" ]
