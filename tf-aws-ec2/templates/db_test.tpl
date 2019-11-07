control 'db' do
  impact 0.6
  title 'Database: check routing from public to private subnet'

  describe host('${db_host_ip}', port: 27017, protocol: 'tcp') do
    it { should be_reachable }
    it { should be_resolvable }
  end

  describe host('${db_host_ip}', port: 80, protocol: 'tcp') do
    it { should_not be_reachable }
  end
end

control 'outbound' do
  impact 0.6
  title 'Public Subnet: check routing out to public internet'

  describe http('https://hashicorp.com') do
    its('status') { should cmp 301 }
  end
end