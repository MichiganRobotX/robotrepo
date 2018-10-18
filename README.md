# Temporary workspace

This is a temporary branch of a catkin workspace that builds so that other member can test their code (arduino, joystick, etc) while the repository gets restructured.

The following will install all dependencies of a catkin workspace if executing in the workspace's root directory:

    rosdep install --from-paths src --ignore-src -r -y
    
Also, make sure that you've let ROS know about your workspace:

    source (your_catkin_ws)/devel/setup.bash
