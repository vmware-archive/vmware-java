staging::file { 'jre-7u21-linux-x64.rpm':
  source      => 'http://download.oracle.com/otn-pub/java/jdk/7u21-b11/jre-7u21-linux-x64.rpm',
  curl_option => '-b gpw_e24=http%3A%2F%2Fwww.oracle.com',
}

class { 'java':
  source  => '/opt/staging',
  require => Staging::File['jre-7u21-linux-x64.rpm'],
}
