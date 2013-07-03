require 'spec_helper'

describe 'java' do
  context 'default' do
    it do
      should contain_package('jre-1.7.0_21').
        with_source('http://repo.vmop.local/java/jre-7u21-linux-x64.rpm')

      should contain_exec('alternatives --install /usr/bin/java java /usr/java/latest/bin/java 30000')
    end
  end

  context 'alternate source and package name' do
    let(:params){{
      :source => '/opt/staging',
      :source_rpm => 'jre-7u24-linux.rpm',
    }}

    it do
      should contain_package('jre-1.7.0_21').
        with_source('/opt/staging/jre-7u24-linux.rpm')

      should contain_exec('alternatives --install /usr/bin/java java /usr/java/latest/bin/java 30000')
    end
  end
end

