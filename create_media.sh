# ---------------------------------------------
# Script to Produce Live Media for Dapper Linux
# ---------------------------------------------

#!/bin/bash

# Variables
project=Dapper-Linux
version=29
location=./Kickstarts/dapper-live-workstation.ks
flatfile=./Kickstarts/dapper-live-workstation-flat.ks
builddir=/var/dapper
name=Dapper-Linux-Live
DATE=`date +%Y-%m-%d`

# Copy Base Install Class to PyAnaconda Location
cp dapperlinux.py /usr/lib64/python3.7/site-packages/pyanaconda/installclasses/

# Patch pylorax to Accept dapper-dracut-live for dracut-live
sed -i "s/dracut-live/dapper-dracut-live/g" /usr/lib/python3.7/site-packages/pylorax/creator.py

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
livemedia-creator --ks $flatfile --no-virt --resultdir $builddir --project $project --make-iso --volid $name --iso-only --iso-name $name-$version-$DATE.iso --releasever $version --title $name --macboot

# Get the Livecd 
cp $builddir/$name-$version-$DATE.iso .

# Re-Enable SELinux
setenforce 1

# Generate CheckSums
openssl sha1 $name-$version-$DATE.iso > $name-$version-$DATE.iso.sha1.txt
openssl sha256 $name-$version-$DATE.iso > $name-$version-$DATE.iso.sha256.txt
