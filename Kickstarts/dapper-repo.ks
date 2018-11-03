# ---------------------------------------------
# Repos
# ---------------------------------------------

# ---------------------------------------------
# Dapper Linux
# ---------------------------------------------


repo --name=dapper-linux-primary --baseurl=https://copr-be.cloud.fedoraproject.org/results/dapperlinux/Primary/fedora-$releasever-$basearch/
repo --name=dapper-linux-kernel --baseurl=https://copr-be.cloud.fedoraproject.org/results/dapperlinux/kernel/fedora-27-$basearch/


# ---------------------------------------------
# Fedora
# ---------------------------------------------


repo --name=fedora --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --name=updates --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch
#repo --name=updates-testing --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-testing-f$releasever&arch=$basearch


# ---------------------------------------------
# RPMFusion
# ---------------------------------------------


repo --name=rpmfusion-free --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch
repo --name=rpmfusion-free-updates --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$releasever&arch=$basearch

url --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
