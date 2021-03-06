require 'spec_helper'

describe 'review::motd' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_file('/etc/motd').with_ensure('file').with_owner('root') }
    end
  end
end
