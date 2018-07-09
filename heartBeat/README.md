# Installing and Building HeartBeat
1) Open a terminal and run ```./install```

2) This will install a package named ```heartbeat``` with a node that takes the following topics as inputs:
	1. GPS Data Topic
	2. Camera Data Topic
	3. Laptop  Data Topic
	4. Controller  Data Topic
	5. LiDAR  Data Topic
and produces signals as per the official competition [communications protocol](https://www.robotx.org/images/RobotX-2018-Communications-Protocol_v0.5.pdf)

3) There are 2 ways to run the heartbeat deamon:
```rosrun heartbeat signal``` or ``` roslaunch heartbeat daemon.launch```
