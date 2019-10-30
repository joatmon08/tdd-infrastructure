db = attribute('mongodb_host', description: 'IP for database')

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('ubuntu'), :skip do
    it { should exist }
  end
end

describe host(db, port: 27017, protocol: 'tcp') do
  it { should be_reachable }
  it { should be_resolvable }
  its('ipaddress') { should include db }
end