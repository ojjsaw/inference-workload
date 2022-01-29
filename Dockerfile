FROM openvino/ubuntu20_dev_no_samples:2021.4.2

ENV PRECISION=FP32
ENV API=sync
ENV ITERATIONS=500 
ENV DEVICE=CPU

WORKDIR /home/openvino/app
COPY entrypoint.sh /home/openvino/app/entrypoint.sh
COPY mobilenet-ssd /home/openvino/app/mobilenet-ssd

ENTRYPOINT [ "/home/openvino/app/entrypoint.sh" ]
