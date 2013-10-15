staging::file { 'jre-7u21-linux-x64.rpm':
  source      => 'http://download.oracle.com/otn-pub/java/jdk/7u21-b11/jre-7u21-linux-x64.rpm',
  curl_option => '-b gpw_e24=http%3A%2F%2Fwww.oracle.com',
}

class { 'java':
  version    => '1.7.0_21',
  source     => '/opt/staging',
  source_rpm => 'jre-7u21-linux-x64.rpm',
  require    => Staging::File['jre-7u21-linux-x64.rpm'],
}
