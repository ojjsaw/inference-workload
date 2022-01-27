FROM openvino/ubuntu20_dev_no_samples:2021.4.2

WORKDIR /home/openvino/app

RUN /opt/intel/openvino/deployment_tools/open_model_zoo/tools/downloader/downloader.py  --name person-detection-retail-0013

COPY entrypoint.sh /home/openvino/app/entrypoint.sh

ENTRYPOINT [ "/home/openvino/app/entrypoint.sh" ]
