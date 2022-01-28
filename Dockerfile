FROM openvino/ubuntu20_dev_no_samples:2021.4.2

ENV PRECISION=FP16-INT8

WORKDIR /home/openvino/app
COPY entrypoint.sh /home/openvino/app/entrypoint.sh

USER root
RUN /opt/intel/openvino/deployment_tools/open_model_zoo/tools/downloader/downloader.py  --name person-detection-retail-0013

USER openvino
ENTRYPOINT [ "/home/openvino/app/entrypoint.sh" ]
