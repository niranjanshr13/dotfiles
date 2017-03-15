# run bash inside python as a subprocess.

# from one discussion thread in Daniweb
import os
class Command(object):
    """Run a command and capture it's output string, error string and exit status"""
    def __init__(self, command):
        self.command = command
    def run(self, shell=True):
        import subprocess as sp
        process = sp.Popen(self.command, shell = shell, stdout = sp.PIPE, stderr = sp.PIPE)
        self.pid = process.pid
        self.output, self.error = process.communicate()
        self.failed = process.returncode
        return self
    @property
    def returncode(self):
        return self.failed
# change find command with anyother bash command.
com = Command("find").run()
# print the output or the error.
print com.output
print com.error
