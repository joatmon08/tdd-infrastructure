control 'db' do
  impact 0.6
  title 'Database: check routing from public to private subnet'

  describe host('10.128.0.44', port: 27017, protocol: 'tcp') do
    it { should be_resolvable }
    it { should be_reachable }
  end
end