output "bucket_write_user_arn" {
  value = "${aws_iam_user.bucket_write_user.arn}"
}

output "bucket_read_user_arn" {
  value = "${aws_iam_user.bucket_read_user.arn}"
}

output "bucket_admin_role_arn" {
  value = "${aws_iam_role.bucket_admin_role.arn}"
}