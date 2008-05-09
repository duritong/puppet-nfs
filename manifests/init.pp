#######################################
# nfs module
# Puzzle ITC - haerry+puppet(at)puzzle.ch
# GPLv3
# This module manages an nfs client
# to manage the nfs server please look
# into the module nfsd
#######################################


# modules_dir { "nfs": }
class nfs {
    case $operatingsystem {
        centos: { include nfs::centos }
        default: { include nfs::base }
    }
}

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

class nfs::centos inherits nfs::base {

    # note sure if this used on all systems so
    # moved it to centos
    service{nfslock:
        ensure => running,
        enable => true,
        hasstatus => true,
        require => Package[nfs-utils],
    }

    service{rpcgssd:
        ensure => stopped,
        enable => false,
        require => Package[nfs-utils],
    }
    service{rpcsvcgssd:
        ensure => stopped,
        enable => false,
        require => Package[nfs-utils],
    }
}
