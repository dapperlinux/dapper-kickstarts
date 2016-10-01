# ---------------------------------------------
# Repos
# ---------------------------------------------

# ---------------------------------------------
# Dapper Linux
# ---------------------------------------------


repo --name="Dapper Linux Main" --baseurl=https://copr-be.cloud.fedoraproject.org/results/dapperlinux/main/fedora-$releasever-$basearch/ --cost=10

# ---------------------------------------------
# Fedora
# ---------------------------------------------


repo --name="Fedora" --mirrorlist=http://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch
repo --name="Fedora Updates" --mirrorlist=http://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch
#repo --name="Fedora Updates Testing" --mirrorlist=http://mirrors.fedoraproject.org/metalink?repo=updates-testing-f$releasever&arch=$basearch


# ---------------------------------------------
# RPMFusion
# ---------------------------------------------


repo --name="RPMFusion Free" --baseurl=http://download1.rpmfusion.org/free/fedora/releases/$releasever/Everything/$basearch/os --cost=1000
repo --name="RPMFusion Free Updates" --baseurl=http://download1.rpmfusion.org/free/fedora/updates/$releasever/$basearch --cost=1000
repo --name="RPMFusion Non-Free" --baseurl=http://download1.rpmfusion.org/nonfree/fedora/releases/$releasever/Everything/$basearch/os --cost=1000
repo --name="RPMFusion Non-Free Updates" --baseurl=http://download1.rpmfusion.org/nonfree/fedora/updates/$releasever/$basearch --cost=1000

url --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch
