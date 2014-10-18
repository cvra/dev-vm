ros-repo:
  pkgrepo.managed:
    - humanname: ROS
    - name: deb http://packages.ros.org/ros/ubuntu trusty main

ros.gpg:
  cmd:
    - run
    - name: 'wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -'
    - unless: 'apt-key list | grep ros.org'

ros-indigo-desktop-full:
  pkg.installed

