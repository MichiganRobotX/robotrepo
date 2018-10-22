package velodyne_msgs;

public interface VelodyneScan extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "velodyne_msgs/VelodyneScan";
  static final java.lang.String _DEFINITION = "# Velodyne LIDAR scan packets.\n\nHeader           header         # standard ROS message header\nVelodynePacket[] packets        # vector of raw packets\n";
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  java.util.List<velodyne_msgs.VelodynePacket> getPackets();
  void setPackets(java.util.List<velodyne_msgs.VelodynePacket> value);
}
