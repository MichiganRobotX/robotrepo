package velodyne_msgs;

public interface VelodynePacket extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "velodyne_msgs/VelodynePacket";
  static final java.lang.String _DEFINITION = "# Raw Velodyne LIDAR packet.\n\ntime stamp              # packet timestamp\nuint8[1206] data        # packet contents\n\n";
  org.ros.message.Time getStamp();
  void setStamp(org.ros.message.Time value);
  org.jboss.netty.buffer.ChannelBuffer getData();
  void setData(org.jboss.netty.buffer.ChannelBuffer value);
}
