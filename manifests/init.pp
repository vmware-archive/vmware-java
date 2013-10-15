# Class: Java
#
# This class installs Oracle JAva
#
# Parameters:
#
#  version: (default 1.7.0_11)
#  Set the version of Java to install
#
#  source: (default http://repo.vmop.local/java)
#
#  source_rpm: (default jre-7u11-linux-x64.rpm)
#
# Actions:
#   - Install java
#   - Create links to jruby executables from /opt/jruby/bin in /usr/local/bin
#
# Requires:
#
# Sample Usage:
#
# For a standard install using the latest Rubygems provided by rubygems-update on Redhat
# use:
#
#     include ::java
#
# To install a specific version of jruby
#
#     class { 'java':
#       version    => '1.7.0_11',
#       source     => 'http://repo.vmwop.local/java',
#       source_rpm => 'jre-7u11-linux-x64.rpm'
#     }
#
class java (
  $version    = $java::params::version,
  $source     = $java::params::source,
  $source_rpm = $java::params::source_rpm
) inherits java::params {

  if 'http://download.oracle.com' in $source {
    staging::file { $source_rpm:
      source      => "${source}/${source_rpm}",
      curl_option => '-b gpw_e24=http%3A%2F%2Fwww.oracle.com',
      before      => Package["jre-${version}"],
    }

    $pkg_source = "/opt/staging/java/${source_rpm}"
  } else {
    $pkg_source = "${source}/${source_rpm}"
  }

  package { "jre-${version}":
    ensure   => present,
    provider => rpm,
    source   => $pkg_source,
  }

  exec { 'alternatives --install /usr/bin/java java /usr/java/latest/bin/java 30000':
    path        => $::path,
    refreshonly => true,
    subscribe   => Package["jre-${version}"],
  }
}
