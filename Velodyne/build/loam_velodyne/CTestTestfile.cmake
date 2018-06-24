# CMake generated Testfile for 
# Source directory: /home/umichaerolab/Music/robotrepo/Velodyne/src/loam_velodyne
# Build directory: /home/umichaerolab/Music/robotrepo/Velodyne/build/loam_velodyne
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_loam_velodyne_rostest_test_loam.test "/home/umichaerolab/Music/robotrepo/Velodyne/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/umichaerolab/Music/robotrepo/Velodyne/build/test_results/loam_velodyne/rostest-test_loam.xml" "--return-code" "/opt/ros/kinetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/umichaerolab/Music/robotrepo/Velodyne/src/loam_velodyne --package=loam_velodyne --results-filename test_loam.xml --results-base-dir \"/home/umichaerolab/Music/robotrepo/Velodyne/build/test_results\" /home/umichaerolab/Music/robotrepo/Velodyne/build/loam_velodyne/test/loam.test ")
subdirs(src/lib)
