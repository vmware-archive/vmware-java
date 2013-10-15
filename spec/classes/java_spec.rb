require 'spec_helper'

describe 'java' do
  context 'default' do
    it do
      should contain_staging__file('jre-7u45-linux-x64.rpm').with({
        :source => 'http://download.oracle.com/otn-pub/java/jdk/7u45-b18/jre-7u45-linux-x64.rpm',
        :before => 'Package[jre-1.7.0_45]',
      })

      should contain_package('jre-1.7.0_45').
        with_source('/opt/staging/java/jre-7u45-linux-x64.rpm')

      should contain_exec('alternatives --install /usr/bin/java java /usr/java/latest/bin/java 30000')
    end
  end

  context 'alternate non Oracle source' do
    let(:params){{
      :source => 'https://dl.dropboxusercontent.com/u/1075709',
    }}

    it do
      should_not contain_staging__file('jre-7u45-linux-x64.rpm')

      should contain_package('jre-1.7.0_45').
        with_source('https://dl.dropboxusercontent.com/u/1075709/jre-7u45-linux-x64.rpm')

      should contain_exec('alternatives --install /usr/bin/java java /usr/java/latest/bin/java 30000')
    end
  end
end

