class nfs::centos inherits nfs::base {
    # note sure if this used on all systems so
    # moved it to centos
    service{nfslock:
        ensure => running,
        enable => true,
        hasstatus => true,
        require => Package[nfs-utils],
    }

    service{[ "rpcgssd", "rpcidmapd", "rpcsvcgssd" ]:
        ensure => stopped,
        enable => false,
        require => Package[nfs-utils],
    }
}
