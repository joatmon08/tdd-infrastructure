describe host('${mongodb_host_ip}', port: 27017, protocol: 'tcp') do
  it { should be_reachable }
  it { should be_resolvable }
end