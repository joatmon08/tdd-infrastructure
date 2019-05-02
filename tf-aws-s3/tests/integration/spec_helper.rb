require 'awspec'

file_content = JSON.parse(File.open("../../test.tfvars").read)
ENV['AWS_REGION'] = file_content['aws_region']
@bucket_name = file_content['bucket_name']