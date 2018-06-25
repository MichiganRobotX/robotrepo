# Installing and Building HeartBeat
1) Open a terminal and run ```./build.sh```

2) This will install a package named ```heartbeat``` with a node that takes the following topics as inputs:
	1. GPS Data Topic
	2. Camera Data Topic
	3. Laptop  Data Topic
	4. Controller  Data Topic
	5. LiDAR  Data Topic

and produces the following status signals:
* <strong>1 (abort) → </strong> <em>if controller and laptop not connected</em>
* <strong>2 (manual | sensors not running) → </strong> <em>if controller and laptop connected</em>
* <strong>3 (manual | sensors running) → </strong> <em>if all sensors, laptop and controller connected and controller sending signals</em>
* <strong>4 (autonomous) → </strong> <em>if all sensors, laptop and controller connected and controller not sending signals</em>

3) There are 2 ways to run the heartbeat deamon:
```rosrun heartbeat signal``` or ``` roslaunch heartbeat daemon.launch```
