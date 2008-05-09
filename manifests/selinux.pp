# manifests/selinux.pp

class nfs::selinux {
    case $operatingsystem {
        gentoo: { include nfs::selinux::gentoo }
        default: { notice("No selinux stuff yet defined for your operatingsystem") }
    }
}

class nfs::selinux::gentoo {
    package{['selinux-nfs', 'selinux-portmap']:
        ensure => present,
        category => 'sec-policy',
        require => Package[nfs-utils],
    }
    selinux::loadmodule {"rpc": require => Package[selinux-nfs] }
    selinux::loadmodule {"portmap": require => Package[selinux-portmap] }
    selinux::module {"nfs":}
}

