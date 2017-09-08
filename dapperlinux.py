from pyanaconda.installclass import BaseInstallClass
from pyanaconda.product import productName
from pyanaconda import network
from pyanaconda import nm

class DapperLinuxBaseInstallClass(BaseInstallClass):
    name = "Dapper Linux"
    sortPriority = 10000
    if not productName.startswith("Dapper"):          # pylint: disable=no-member
        hidden = True

    _l10n_domain = "anaconda"

    efi_dir = "dapper"

    help_placeholder = "DapperLinuxPlaceholder.html"
    help_placeholder_plain_text = "DapperLinuxPlaceholder.txt"
    help_placeholder_with_links = "DapperLinuxPlaceholderWithLinks.html"

    def configure(self, anaconda):
        BaseInstallClass.configure(self, anaconda)

    def setNetworkOnbootDefault(self, ksdata):
        if any(nd.onboot for nd in ksdata.network.network if nd.device):
            return
        # choose first wired device having link
        for dev in nm.nm_devices():
            if nm.nm_device_type_is_wifi(dev):
                continue
            try:
                link_up = nm.nm_device_carrier(dev)
            except (nm.UnknownDeviceError, nm.PropertyNotFoundError):
                continue
            if link_up:
                network.update_onboot_value(dev, True, ksdata=ksdata)
                break

    def __init__(self):
        BaseInstallClass.__init__(self)
