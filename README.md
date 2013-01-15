# Java Module
===

This module manages Oracle Java on Redhat based systems.

## Parameters

*  version: (default 1.7.0_11)
 Set the version of Java to install
*  source_rpm: (default http://repo.vmop.local/java/jre-7u11-linux-x64.rpm)
 Set the source location for the Java source file.

## Installation

On the Puppet Master server:
	
	$ cd /etc/puppetlabs/puppet/modules
	$ git clone https://github.com/VMop/vmware-java.git java
	
## Usage

For a standard install use:

    node 'node1.local' {
      include java
    }

To install a specific version of jruby, use:

    node 'node1.local' {
      class { 'java':
        version => '1.7.0_11',
        source_rpm => 'http://repo.vmop.local/java/jre-7u11-linux-x64.rpm'
      }
    }

## Note

This module defaults to Oracle Java 7 Update 11. .

## Contributing
 1. Fork it
 2. Create your feature branch (git checkout -b my-new-feature)
 3. Commit your changes (git commit -am 'Add some feature')
 4. Push to the branch (git push origin my-new-feature)
 5. Create new Pull Request
 
## LICENSE
===
******************************************************

Copyright (c) 2012 VMware, Inc. All rights reserved.

******************************************************