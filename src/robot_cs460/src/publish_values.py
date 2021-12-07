#!/usr/bin/env python
import rospy, sys
from robot_cs460.msg import Position

def publisher():
    pub = rospy.Publisher('Write_Direction', Position)
    rospy.init_node('Publish_MSG', anonymous=True)
    r = rospy.Rate(10)
    
    msg = Position()
    msg.direction = sys.argv[1]

    while not rospy.is_shutdown():
        rospy.loginfo(msg)
        pub.publish(msg)
        r.sleep()

if __name__ == '__main__':
    if len(sys.argv) != 2:
    	print("You did not provide a direction")
    	sys.exit(1)

    try:
        publisher()
    except rospy.ROSInterruptException: 
    	pass
