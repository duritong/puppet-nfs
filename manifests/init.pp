#
# apache module
#
# Copyright 2008, admin(at)immerda.ch
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#
# This module manages an nfs client
# to manage the nfs server please look
# into the module nfsd
#

class nfs {
  case $::operatingsystem {
    centos: { include nfs::centos }
    default: { include nfs::base }
  }
}
