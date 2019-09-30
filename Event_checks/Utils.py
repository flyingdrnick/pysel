import re
import subprocess

class Utils:

    @staticmethod
    def string_exists(targetFile, searchString):
        try:
            for line in open(targetFile, 'r').readlines():
                if re.search(searchString, line):
                    return True
            return False
        except:
            return False
    
    @staticmethod
    def run_command(command):
        command = command.split(' ')
        cmd = subprocess.Popen(command, stdout=subprocess.PIPE)
        return cmd.stdout.read()

    @staticmethod
    def package_installed(package):
        if package in str(Utils.run_command('dpkg --list')):
            return True
        else:
            return False

    @staticmethod
    def service_running(service):
        check_service = 'sudo systemctl status ' + service
        output = str(Utils.run_command(check_service))
        if ' active ' in output:
            return True
        else:
            return False

    @staticmethod
    def user_in_group(user, group):
        command = "grep " + group + " /etc/group"
        output = Utils.run_command(command).decode().rstrip().split(":")
        if user in output:
            return True
        else:
            return False

    @staticmethod
    def check_perm(filename):
        command = 'stat -c %a ' + filename
        output = Utils.run_command(command).decode().rstrip()
        return output

    @staticmethod
    def check_kernel():
        command = 'uname -r'
        output = Utils.run_command(command).decode().rstrip()
        return output
    
    @staticmethod
    def file_exists(path):
        if subprocess.call("test -e '{}'".format(path), shell=True):
            return False
        else:
            return True