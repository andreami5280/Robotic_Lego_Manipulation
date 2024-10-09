#!/bin/bash
mkdir -p /tmp/ros_logs
chmod -R 755 /tmp/ros_logs
export ROS_LOG_DIR=/tmp/ros_logs

source /opt/ros/noetic/setup.bash
catkin build
source /catkin_ws/devel/setup.bash
echo "sourcing new setup"
source devel/setup.bash
echo "running fanuc_rviz"
roslaunch robot_digital_twin fanuc_rviz.launch &
echo "running fanuc"
roslaunch robot_digital_twin fanuc.launch &
echo "running controller_node"
roslaunch stmotion_controller controller_node.launch &
echo "running lego_manipulation_node"
roslaunch lego_manipulation lego_manipulation_node.launch
echo "complete"

#sleep infinity


