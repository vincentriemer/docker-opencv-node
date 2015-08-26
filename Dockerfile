FROM node:latest

RUN echo "deb http://ftp.us.debian.org/debian jessie main contrib non-free\ndeb-src http://ftp.us.debian.org/debian jessie main contrib non-free\ndeb http://security.debian.org/ jessie/updates main contrib non-free\ndeb-src http://security.debian.org/ jessie/updates main contrib non-free" > /etc/apt/sources.list

RUN apt-get update && apt-get install -y --force-yes sudo git wget unzip

RUN echo "deb http://www.deb-multimedia.org jessie main non-free" >> /etc/apt/sources.list
RUN wget http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2015.6.1_all.deb
RUN dpkg -i deb-multimedia-keyring_2015.6.1_all.deb
RUN apt-get update && apt-get install -y ffmpeg

RUN git clone https://github.com/jayrambhia/Install-OpenCV.git
RUN cd Install-OpenCV/Ubuntu && bash dependencies.sh
RUN cd Install-OpenCV/Ubuntu/2.4 && bash opencv2_4_10.sh

ENTRYPOINT sh -c 'ln -s /dev/null /dev/raw1394'; 
