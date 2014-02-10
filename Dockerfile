
FROM ubuntu:12.10

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y openssh-server python
RUN mkdir /var/run/sshd
RUN mv /etc/ssh/sshd_config /etc/ssh/sshd_config.0
ADD sshd_config /etc/ssh/sshd_config

# Need to set the password for bison manually and commit that image
# Or use makepasswd to create the encrypted password
# bison D1qasOdCDpuAA
RUN useradd --create-home --shell /bin/bash --groups sudo --password D1qasOdCDpuAA bison

RUN su bison -c 'mkdir --mode 0700 /home/bison/.ssh'
ADD test1.pub /home/bison/.ssh/authorized_keys

CMD /usr/sbin/sshd -D

