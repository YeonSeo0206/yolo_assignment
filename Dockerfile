FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /darknet

RUN apt-get update && apt-get install -y \ 
    wget \ 
    libopencv-core4.2 \ 
    libopencv-imgproc4.2 \ 
    libopencv-highgui4.2 \ 
    && rm -rf /var/lib/apt/lists/*

RUN wget https://pjreddie.com/media/files/yolov3.weights

COPY darknet .
COPY cfg/ ./cfg/
COPY data/ ./data/

ENTRYPOINT ["./darknet", "detector", "test", "cfg/coco.data", "cfg/yolov3.cfg", "yolov3.weights"]