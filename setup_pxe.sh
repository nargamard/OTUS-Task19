#!/bin/bash

sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*

yum -y install wget
mkfs.xfs /dev/sdb
mkfs.xfs /dev/sdc
mkfs.xfs /dev/sdd

mount /dev/sdb /root
mount /dev/sdc /mnt
mount /dev/sdd /iso

wget --no-check-certificate -P /root https://mirror.nsc.liu.se/centos-store/8.4.2105/isos/x86_64/CentOS-8.4.2105-x86_64-dvd1.iso
