# Installing and Building HeartBeat
1) Open a terminal and run ```./build.sh```

2) This will install a package named ```heartbeat``` with a node that takes the following topics as inputs
	i. GPS Data Topic
	ii. Camera Data Topic
	iii. Laptop  Data Topic
	iv. Controller  Data Topic
	v. LiDAR  Data Topic

	and produces the following status signals:
	(1) :- if controller and laptop not connected - Abort
	(2) :- if controller and laptop connected - manual mode (autonomy incapable)
	(3) :- if all sensors, laptop and controller connected and controller sending signals - manual mode (autonomy capable)
	(4) :- if all sensors, laptop and controller connected and controller not sending signals - autonomous mode

3) There are 2 ways to run the heartbeat deamon:
```rosrun heartbeat signal``` or ``` roslaunch heartbeat daemon.launch```