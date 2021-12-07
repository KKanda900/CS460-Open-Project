#!/usr/bin/env python3

import sys
import rospy
from geometry_msgs.msg import Twist
from robot_cs460.msg import Position

def set_movement(direction, velocity, time):
    move_pub = rospy.Publisher('cmd_vel', Twist , queue_size=10)
    move = Twist()
    rate = rospy.Rate(10) 
 	
    i = 0
    while i != time:
        if direction.lower() == 'forward':
            move.linear.x = velocity*0.01              
            move.angular.z = 0*0.01 
        else:
            move.linear.x = 0*0.01              
            move.angular.z = velocity*0.01
        move_pub.publish(move)
        i+=1
        rate.sleep()
        
    rospy.is_shutdown()

def callback(data):
    rospy.loginfo("%s" % (data.direction))

    velocity = float(sys.argv[1])
    time = float(sys.argv[2])
    direction = data.direction # either forward or turn

    set_movement(direction, velocity, time)
    
def listen():
    rospy.init_node('listen', anonymous=True)
    rospy.Subscriber("Write_Direction", Position, callback)

    rospy.spin()

if __name__ == "__main__":
    try:
        listen()
    except rospy.ROSInterruptException:
        pass

