import sys
import rospy
from geometry_msgs.msg import Twist, Point
from robot_cs460.msg import Position

def callback(data):
    rospy.loginfo("%s" % (data.direction))
    
def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("Write_Direction", Position, callback)
   
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()