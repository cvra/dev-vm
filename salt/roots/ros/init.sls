ros_repo:
    pkgrepo.managed:
        - name: deb http://packages.ros.org/ros/ubuntu trusty main
        - dist: trusty
        - file: /etc/apt/sources.list.d/ros-latest.list
        - key_url: https://raw.githubusercontent.com/ros/rosdistro/master/ros.key

    cmd.run:
        - name: 'wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -'
        - unless: 'apt-key list | grep ros.org'

{% for pkg in ["ros-indigo-desktop", "python-rosinstall",
               "python-catkin-tools",
               "ros-indigo-robot-state-publisher",
               "ros-indigo-urdf",
               "ros-indigo-xacro",
               "ros-indigo-geometry-msgs",
               "ros-indigo-sensor-msgs",
               "ros-indigo-std-msgs",
               "ros-indigo-std-srvs",
] %}
{{ pkg }}:
    pkg.installed:
        - require:
            - pkgrepo: ros_repo
{% endfor %}

rosdep_init:
    cmd.run:
        - name: "rosdep init"
        - user: root

        # Avoid running rosdep if it was already written once
        - creates: "/etc/ros/rosdep/sources.list.d/20-default.list"

rosdep_update:
    cmd.run:
        - name: "rosdep update"
        - user: cvra
        - creates: "/home/cvra/.ros/rosdep/"

ros_source_setup:
    file.append:
        - name: "/etc/bash.bashrc"
        - text: "source /opt/ros/indigo/setup.bash"

catkin_workspace:
    file.directory:
        - name: "/home/cvra/catkin_ws/src"
        - user: cvra
        - group: cvra
        - makedirs: True

    cmd.run:
        - name: "source /opt/ros/indigo/setup.bash; catkin_init_workspace"
        - user: cvra
        - cwd: "/home/cvra/catkin_ws/src"
        - creates: "/home/cvra/catkin_ws/src/CMakeLists.txt"
        - require:
            - file: catkin_workspace

    git.latest:
        - name: "https://github.com/cvra/roscvra.git"
        - target: "/home/cvra/catkin_ws/src/roscvra"
        - rev: "master"
        - user: cvra
        - submodules: True

