#!/usr/bin/env python3
#{{{Importing Module
import os, subprocess
#}}}
#{{{ Variables
cloudDrive = '/tmp/cloud_drive/'
cloudAccount = subprocess.Popen(['rclone', 'listremotes'], stdout=subprocess.PIPE)
#}}}
#{{{ Cloud Home Directory
if not os.path.exists(cloudDrive):
	os.makedirs(cloudDrive)
#}}}
#{{{ Mounting all the drive
for loop in cloudAccount.stdout.readlines():
	directory = loop.decode("utf-8").strip('\n')
	if not os.path.exists(cloudDrive + directory):
		os.makedirs(cloudDrive + directory)
	subprocess.Popen(['rclone', 'mount', directory, cloudDrive + directory], shell=False)
#}}}
