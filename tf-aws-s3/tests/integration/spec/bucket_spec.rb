require './spec_helper'

bucket_policy = JSON.parse(File.open("../../policies/bucket.json").read)

describe s3_bucket(@bucket_name) do
    it { should exist }
    its(:acl_grants_count) { should eq 1 }
    its('policy.policy.read') { should include bucket_policy['Statement'][0]['Sid'] }
    its('policy.policy.read') { should include bucket_policy['Statement'][0]['Action'][0] }
    its('policy.policy.read') { should include bucket_policy['Statement'][0]['Resource'][0] }
    its('policy.policy.read') { should include bucket_policy['Statement'][1]['Sid'] }
    its('policy.policy.read') { should include bucket_policy['Statement'][1]['Action'][0] }
    its('policy.policy.read') { should include bucket_policy['Statement'][1]['Resource'][0] }
    its('policy.policy.read') { should include bucket_policy['Statement'][2]['Sid'] }
    its('policy.policy.read') { should include bucket_policy['Statement'][2]['Action'][0] }
    its('policy.policy.read') { should include bucket_policy['Statement'][2]['Resource'][0] }
    its('policy.policy.read') { should include bucket_policy['Statement'][2]['Resource'][1] }
end