require './spec_helper'

bucket_write_user = "#{@bucket_name}WriteUser"
bucket_write_user_policy = "#{@bucket_name}WriteUserPolicy"
bucket_read_user = "#{@bucket_name}ReadUser"
bucket_read_user_policy = "#{@bucket_name}ReadUserPolicy"
bucket_admin_role = "#{@bucket_name}AdminRole"
bucket_admin_role_policy = "#{@bucket_name}AdminRolePolicy"

describe iam_user(bucket_write_user) do
    it { should exist }
    it { should have_inline_policy(bucket_write_user_policy) }
end

describe iam_user(bucket_read_user) do
    it { should exist }
    it { should have_inline_policy(bucket_read_user_policy) }
end

describe iam_role(bucket_admin_role) do
    it { should exist }
    it { should have_iam_policy(bucket_admin_role_policy) }
end