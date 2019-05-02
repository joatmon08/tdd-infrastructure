output "bucket_write_user_arn" {
  value = "${aws_iam_user.bucket_write_user.arn}"
}

output "bucket_write_user_access_id" {
  value = "${aws_iam_access_key.bucket_write_user.id}"
}
output "bucket_write_user_secret_key" {
  value = "${aws_iam_access_key.bucket_write_user.encrypted_secret}"
}

output "bucket_read_user_access_id" {
  value = "${aws_iam_access_key.bucket_read_user.id}"
}

output "bucket_read_user_secret_key" {
  value = "${aws_iam_access_key.bucket_read_user.encrypted_secret}"
}

output "bucket_read_user_arn" {
  value = "${aws_iam_user.bucket_read_user.arn}"
}

output "bucket_admin_role_arn" {
  value = "${aws_iam_role.bucket_admin_role.arn}"
}

output "bucket_admin_access_id" {
  value = "${aws_iam_access_key.bucket_admin_user.id}"
}

output "bucket_admin_secret_key" {
  value = "${aws_iam_access_key.bucket_admin_user.encrypted_secret}"
}

