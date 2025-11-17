
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /darknet

RUN apt-get update && apt-get install -y \
    wget \
    libopencv-core4.2 \
    libopencv-imgproc4.2 \
    libopencv-highgui4.2 \
    && rm -rf /var/lib/apt/lists/*

COPY darknet .
COPY cfg/ ./cfg/
COPY data/ ./data/
COPY yolov3.weights .
COPY run_yolo.sh .

ENTRYPOINT ["./run_yolo.sh"]
