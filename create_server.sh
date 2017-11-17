# ---------------------------------------------
# Script to Produce Server Media for Dapper Linux
# ---------------------------------------------

#!/bin/bash

# Variables
project=Dapper-Linux
version=27
variant=Server
name=$project-$variant
arch=x86_64
location=./Kickstarts/dapper-disk-server.ks
flatfile=./Kickstarts/dapper-disk-server-flat.ks
bugurl=https://github.com/dapperlinux/dapper-linux-issues
DATE=`date +%Y-%m-%d`

# Remove Previous Buildfiles
rm -rf $version
rm -rf fedora
rm -rf logs
rm -rf snippets
rm -rf updates
rm -rf work

# Remove Previous Remmanants
rm -rf $name-$version-*.iso*

# Disable SELinux Because of Policy Reasons
setenforce 0

# Flatten the Kickstart files into one
ksflatten --config $location --output $flatfile

# Copy Base Install Class to PyAnaconda Location
mkdir -p work/$variant/$arch/installtree/usr/lib64/python3.6/site-packages/pyanaconda/installclasses/
cp dapperlinux.py work/$variant/$arch/installtree/usr/lib64/python3.6/site-packages/pyanaconda/installclasses/

# Create ISO image
pungi --config $flatfile --name $name --family $project --flavor $variant --ver $version --bugurl $bugurl --nosource --nodebuginfo --isfinal

# Get the ISO 
cp ./$version/$variant/$arch/iso/$name-DVD-$arch-$version.iso .
mv $name-DVD-$arch-$version.iso $name-$version-$DATE.iso

# Re-Enable SELinux
setenforce 1

# Generate CheckSums
openssl sha1 $name-$version-$DATE.iso > $name-$version-$DATE.iso.sha1.txt
openssl sha256 $name-$version-$DATE.iso > $name-$version-$DATE.iso.sha256.txt
