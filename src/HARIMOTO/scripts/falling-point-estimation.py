#!/usr/bin/python3

## SPDX-FileCopyrightText: 2024 Michitoshi Tsubaki <michi.tsubaki.tech@g.ecc.u-tokyo.ac.jp>
## SPDX-License-Identifier: BSD-3-Clause

import sys
import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

def image_cb(msg):
    global image_raw
    rospy.loginfo("get image data")
    bridge = CvBridge()
    image_raw = bridge.imgmsg_to_cv2(msg, "bgr8") #ROS形式からopenCV形式に変換

def hsv_color_filter(img):
    hsvdata = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    lower_hsv1 = np.array([0, 0, 0])
    upper_hsv1 = np.array([30, 255, 255])
    img_mask1 = cv2.inRange(hsvdata, lower_hsv1, upper_hsv1)
    lower_hsv2 = np.array([150, 0, 0])
    upper_hsv2 = np.array([180, 255, 255])
    img_mask2 = cv2.inRange(hsvdata, lower_hsv2, upper_hsv2)
    img_mask = img_mask1 + img_mask2
    filtered_img = cv2.bitwise_and(img, img, mask=img_mask)
    return filtered_img
    
def main():
    global image_raw
    image_raw = None
    rospy.init_node("falling_estimation", anonymous = True)
    #rospy.Subscriber("/camera/color/image_raw", Image, image_cb)
    rospy.Subscriber("/usb_cam/image_raw", Image, image_cb)
    rate = rospy.Rate(90)
    while not rospy.is_shutdown():
        if image_raw is not None:
            img = hsv_color_filter(image_raw)
            cv2.imshow("image_raw", img)
            key = cv2.waitKey(1) #1ms待機=ほぼリアルタイムで表示できるはず
            if key == 27:
                break
        rate.sleep
    cv2.destroyAllWindows()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
