#!/usr/bin/python3

'''
what is this:
    this is script that take screenshot of the of x second and create a phash and rename that video to phash.


what need to be done:
    - this is very bad script` and method.
    - need to create a multiple screenshot. 

'''



import imagehash
from PIL import Image
import os

files = [f for f in os.listdir('.') if os.path.isfile(f)]
for file in files:
    if 'mp4' in f:
        # extracting frame.
        os.system('ffmpeg -i ' + file + ' -t 00:00:03 -vframes 1 ' + file + '.jpg')
        # imagehash
        imageValue = imagehash.dhash(Image.open(file + '.jpg'))
        os.system('mv ' + file + ' ' + str(imageValue) + '.mp4')
        os.system('rm ' + file + '.jpg')
        print(imageValue)
'''

before steps:
    1. delete every file below 100KB
    2. delete duplicate files


steps:
    1. extract 1 frame and give that image a video-file-name.mp4.jpg
    2. use image hash and find hash and rename the original video to the image hash
    3. do every file.
    4. use find command and delete the same file name
'''

