FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /darknet
RUN apt-get update && apt-get install -y git make gcc g++ wget && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/pjreddie/darknet /darknet
RUN make
RUN wget https://pjreddie.com/media/files/yolov3.weights
ENTRYPOINT ["/bin/bash", "-c", "wget -O input.jpg $1 && ./darknet detect cfg/yolov3.cfg yolov3.weights input.jpg", "--"]
