#! /bin/sh
mydate=`date +%y%m%d%H%M%S`
#If you do not want packer to log then comment out the PACKER_LOG variable.
#It should be used for debug only.
#export PACKER_LOG=1
export PACKER_LOG_PATH="/tmp/packerlog.log.${mydate}"
# simp_prompt should be "simp"
# export SIMP_PACKER_simp_prompt="simp"
export SIMP_PACKER_fips="0"
# Should be either "simp_disk_crypt" or "simp_crypt_disk" or ""
export SIMP_PACKER_disk_encrypt=""
#The network interface for the host only will be pulled from the simp_conf.yaml file
#you provide with this.
export SIMP_PACKER_host_only_network_name="vboxnet0"
# The interface used by packer and Vagrant to connect to the system.
# Network interface is probably eth0 or enp0s3 depending on if the system
# is CentOS 6 or 7.  The name is what ever you made it when creating the
#natNetwork.  NatNetwork is the default name.
export SIMP_PACKER_nat_network_if="enp0s3"
export SIMP_PACKER_nat_network_name="NatNetwork"
export SIMP_PACKER_big_sleep="<wait>"
export SIMP_PACKER_root_password="Puppet"
export SIMP_PACKER_vagrant_password="Vagrant"