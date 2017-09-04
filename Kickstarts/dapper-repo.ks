# ---------------------------------------------
# Repos
# ---------------------------------------------

# ---------------------------------------------
# Dapper Linux
# ---------------------------------------------


repo --name="Dapper Linux Main" --baseurl=https://copr-be.cloud.fedoraproject.org/results/dapperlinux/main/fedora-$releasever-$basearch/ --cost=10


# ---------------------------------------------
# Xpra Beta
# ---------------------------------------------

repo --name="Xpra" --baseurl=https://xpra.org/dists/Fedora/$releasever/$basearch/ --cost=11
#repo --name="Xpra Beta" --baseurl=https://xpra.org/beta/Fedora/$releasever/$basearch/ --cost=11


# ---------------------------------------------
# Fedora
# ---------------------------------------------


repo --name="Fedora" --mirrorlist=http://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch
repo --name="Fedora Updates" --mirrorlist=http://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch
#repo --name="Fedora Updates Testing" --mirrorlist=http://mirrors.fedoraproject.org/metalink?repo=updates-testing-f$releasever&arch=$basearch


# ---------------------------------------------
# RPMFusion
# ---------------------------------------------


repo --name="RPMFusion Free" --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch
repo --name="RPMFusion Free Updates" --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$releasever&arch=$basearch

url --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch
