describe host('10.128.0.27', port: 27017, protocol: 'tcp') do
  it { should be_reachable }
  it { should be_resolvable }
end