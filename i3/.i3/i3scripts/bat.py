#!/usr/bin/env python3
from subprocess import check_output

status = check_output(['acpi'], universal_newlines=True)

if 'Discharging' in status:
    charg = 'D'
else:
    charg = 'C'

remainingTime = status.split(' ')[4].split(':')[2]
remainingBatt = status.split(' ')[3].split(',')[0]

print(charg + '-' + remainingTime + '+' +remainingBatt)
