resource "aws_iam_user" "bucket_write_user" {
  name = "${var.bucket_name}WriteUser"
}

resource "aws_iam_user_policy" "bucket_write_user" {
  name = "${var.bucket_name}WriteUserPolicy"
  user = "${aws_iam_user.bucket_write_user.name}"

  policy = "${file("policies/bucket-write-user.json")}"
}

resource "aws_iam_user" "bucket_read_user" {
  name = "${var.bucket_name}ReadUser"
}

resource "aws_iam_user_policy" "bucket_read_user" {
  name = "${var.bucket_name}ReadUserPolicy"
  user = "${aws_iam_user.bucket_read_user.name}"

  policy = "${file("policies/bucket-read-user.json")}"
}

resource "aws_iam_role" "bucket_admin_role" {
  name = "${var.bucket_name}AdminRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": { "AWS": "arn:aws:iam::REDACTED:root" },
    "Action": "sts:AssumeRole",
    "Condition": { "Bool": { "aws:MultiFactorAuthPresent": "true" } }
  }
}
EOF
}

resource "aws_iam_policy" "bucket_admin_role" {
  name   = "${var.bucket_name}AdminRolePolicy"

  policy = "${file("policies/bucket-admin-role.json")}"
}

resource "aws_iam_role_policy_attachment" "bucket_admin_role" {
  role       = "${aws_iam_role.bucket_admin_role.name}"
  policy_arn = "${aws_iam_policy.bucket_admin_role.arn}"
}