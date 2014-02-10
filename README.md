
# Setup with Docker

From http://docker.io

    ssh-keygen -f test1
    # Move the private key to ~/.ssh and configure ssh
    # Host 0.0.0.0
    #   IdentityFile ~/.ssh/test1

    sudo docker -t testing:sshd build .
    sudo docker images
    sudo docker run -d -p 22 testing:sshd
    sudo docker ps
    sudo docker port <container_id> 22
    sudo docker stop <container_id>
    sudo docker kill <container_id>

# Examples with Ansible

ssh is already configured to connect to the hosts using ~/.ssh/config to
specify the IdentityFile and optionally a port, username and so on.


## Adhoc Usage

We can run adhoc commands on hosts with the ansible command
http://docs.ansible.com/intro_adhoc.html

See http://docs.ansible.com/modules.html for a list of modules (commands).

Local documentation is availble with

    ansible-doc --list
    ansible-doc command

    # Gather facts about demo hosts.  Facts can be used in ansible playbooks
    # or with adhoc commands.
    ansible all -i demo.hosts -m setup

    ansible all -i demo.hosts -m ping

    ansible all -i demo.hosts --sudo --ask-sudo-pass -a 'ls -al /root'

    ansible all -i demo.hosts -m copy -a "src=/etc/hosts dest=/tmp/hosts"

    ansible all -m user -a "name=foo password=<crypted password here>"

    ansible all -m user -a "name=foo state=absent"

