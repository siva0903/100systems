FROM centos
MAINTAINER "Siva Ramanathan" sramanat@redhat.com
RUN yum -y update
RUN yum install -y passwd openssh-server openssh-clients initscripts

RUN echo 'root:root' | chpasswd
RUN /usr/bin/ssh-keygen -q -t rsa -N '' -f /etc/ssh/ssh_host_rsa_key

EXPOSE 22
CMD /usr/sbin/sshd -D
