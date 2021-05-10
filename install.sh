#!/bin/bash
rpm -e --nodeps centos-linux-release
rpm -e --nodeps centos-linux-repos

cat > /etc/yum.repos.d/Rocky-BaseOS.repo <<-EOF
# Rocky-BaseOS.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for Rocky updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[baseos]
name=Rocky Linux $releasever - BaseOS
baseurl=http://dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/
gpgcheck=0
enabled=1
EOF

dnf install rocky-repos
dnf update

