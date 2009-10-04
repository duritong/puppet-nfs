class nfs::base {
    package{nfs-utils:
        ensure => installed,
    }

    service{portmap:
        ensure => running,
        enable => true,
        hasstatus => true,
        require => Package[nfs-utils],
    }
}
