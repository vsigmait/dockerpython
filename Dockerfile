from ubuntu

RUN apt-get update

RUN apt-get install -y apt-utils

RUN apt-get install -y build-essential cmake pkg-config
RUN apt-get install -y libjpeg-dev libtiff5-dev
RUN apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
RUN apt-get install -y libxvidcore-dev libx264-dev
RUN apt-get install -y libgtk2.0-dev libgtk-3-dev
RUN apt-get install -y libatlas-base-dev gfortran
RUN apt-get install -y python2.7-dev python3-dev

RUN apt-get install -y wget

RUN apt-get install -y vim

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN python3 get-pip.py

RUN pip2 install numpy
RUN pip3 install numpy

RUN apt-get install -y zip
RUN apt-get install -y unzip

RUN cd \
    && wget https://github.com/opencv/opencv/archive/3.3.0.zip \
    && unzip 3.3.0.zip \
    && cd opencv-3.3.0 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make -j8 \
    && make install \
    && cd \
    && rm 3.3.0.zip

RUN cd \
    && wget https://github.com/opencv/opencv_contrib/archive/3.3.0.zip \
    && unzip 3.3.0.zip \
    && cd opencv-3.3.0/build \
    && cmake -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.3.0/modules/ .. \
    && make -j8 \
    && make install \
    && cd ../.. \
    && rm 3.3.0.zip


RUN ldconfig
