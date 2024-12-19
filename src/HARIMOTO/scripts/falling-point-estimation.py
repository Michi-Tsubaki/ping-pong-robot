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

def moving_object_extractor(previmg,nextimg):
    ##https://qiita.com/otakoma/items/04216c60fa31eae60947 を参考にした．
    color_diff = cv2.absdiff(nextimg, previmg)
    gray_diff = cv2.cvtColor(color_diff, cv2.COLOR_BGR2GRAY)
    return gray_diff

def dilation_image(dilationSize, kernelSize, img):
    ##https://qiita.com/otakoma/items/04216c60fa31eae60947 を引用した．
    kernel = np.ones((kernelSize, kernelSize), np.uint8)
    element = cv2.getStructuringElement(
        cv2.MORPH_RECT, (2 * dilationSize + 1, 2 * dilationSize + 1), (dilationSize, dilationSize))
    dilation_img = cv2.dilate(img, kernel, element)
    return dilation_img

#def find_balls(img):
#    image, contours, hierarchy = cv2.findountours(
#

def main():
    global image_raw
    image_raw = None
    img = None
    rospy.init_node("falling_estimation", anonymous = True)
    rospy.Subscriber("/camera/color/image_raw", Image, image_cb)
    #rospy.Subscriber("/usb_cam/image_raw", Image, image_cb)
    rate = rospy.Rate(90)
    while not rospy.is_shutdown():
        if image_raw is not None:
            previmg = img
            img = hsv_color_filter(image_raw)
            nextimg = img
            if not previmg is None:
                diff = moving_object_extractor(previmg, nextimg)
                output = dilation_image(20,3,diff)
                cv2.imshow("image_raw", output)
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
