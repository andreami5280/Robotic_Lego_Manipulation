FROM osrf/ros:noetic-desktop-full
RUN apt-get update && apt-get install -y \
        build-essential \
        cmake \
        libeigen3-dev \
        libopencv-dev \
        software-properties-common
RUN curl -sSL http://get.gazebosim.org | sh
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
RUN sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
RUN sudo apt update
RUN sudo apt-get install -y librealsense2-utils librealsense2-dev librealsense2-dbg
RUN sudo apt install -y python3-catkin-tools python3-osrf-pycommon
#RUN sudo apt-get install -y ros-noetic-ros-gz
WORKDIR /catkin_ws/src/
COPY . .
WORKDIR /catkin_ws/
ENTRYPOINT ["./src/Robotic_Lego_Manipulation/repos_launch.sh"]
#CMD sleep infinity