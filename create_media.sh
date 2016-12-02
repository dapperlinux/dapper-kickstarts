# ---------------------------------------------
# Script to Produce Live Media for Dapper Linux
# ---------------------------------------------

#!/bin/bash

# Variables
version=25
location=./Kickstarts/dapper-live.ks
flatfile=./Kickstarts/dapper-live-flat.ks
builddir=/var/dapper
name=Dapper-Linux-Live

# Remove Previous Logfiles
rm livemedia.log
rm program.log
rm -rf anaconda

# Remove Previous Image
rm -rf $builddir

# Disable SELinux Because of Policy Reasons
setenforce 0

# Flatten the Kickstart files into one
ksflatten --config $location --output $flatfile

# Produce the livecd
livemedia-creator --ks $flatfile --no-virt --resultdir $builddir --project $name --make-iso --volid $name --iso-only --iso-name $name-$version.iso --releasever $version --title $name --macboot

# Get the Livecd 
cp $builddir/$name-$version.iso .

# Re-Enable SELinux
setenforce 1
