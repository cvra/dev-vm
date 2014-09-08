gazebo-repo:
  pkgrepo.managed:
    - humanname: Gazebo Sim
    - name: deb http://packages.osrfoundation.org/gazebo/ubuntu trusty main

gazebo.gpg:
  cmd:
    - run
    - name: 'wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -'
    - unless: 'apt-key list | grep osrfoundation.org'

gazebo4:
  pkg.installed



