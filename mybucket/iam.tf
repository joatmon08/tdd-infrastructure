resource "aws_iam_user" "bucket_write_user" {
  name = "${var.bucket_name}WriteUser"
}

resource "aws_iam_access_key" "bucket_write_user" {
  user    = "${aws_iam_user.bucket_write_user.name}"
  pgp_key = "${var.pgp_key}"
}

resource "aws_iam_user_policy" "bucket_write_user" {
  name = "${var.bucket_name}WriteUserPolicy"
  user = "${aws_iam_user.bucket_write_user.name}"

  policy = "${file("policies/bucket-write-user.json")}"
}

resource "aws_iam_user" "bucket_read_user" {
  name = "${var.bucket_name}ReadUser"
}

resource "aws_iam_access_key" "bucket_read_user" {
  user    = "${aws_iam_user.bucket_read_user.name}"
  pgp_key = "${var.pgp_key}"
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
    "Principal": { "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root" },
    "Action": "sts:AssumeRole"
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

resource "aws_iam_user" "bucket_admin_user" {
  name = "${var.bucket_name}Admin"
}

resource "aws_iam_access_key" "bucket_admin_user" {
  user    = "${aws_iam_user.bucket_admin_user.name}"
  pgp_key = "${var.pgp_key}"
}

resource "aws_iam_user_policy" "bucket_admin_user" {
  name = "${var.bucket_name}AdminPolicy"
  user = "${aws_iam_user.bucket_admin_user.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
    "Resource": "${aws_iam_role.bucket_admin_role.arn}"
  }
}
EOF
}