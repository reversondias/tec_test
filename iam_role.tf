resource "aws_iam_role" "s3-role" {
  name = "s3-access-role"

  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "s3.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOF
}

# resource "aws_iam_role_policy" "s3-role-policy" {
#   name = "s3-access-role-policy"
#   role = aws_iam_role.s3-role.id

#   policy = <<-EOF
#   {
#     "Id": "Policy1611597205924",
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Sid": "Stmt1611597201485",
#         "Action": "s3:*",
#         "Effect": "Allow",
#         "Resource": "${var.arn_s3}/*",
#         "Principal": {
#           "AWS": [
#             "ec2"
#           ]
#         }
#       }
#     ]
#   }
#   EOF
# }

resource "aws_iam_policy" "s3-role-policy" {
  name        = "s3-access-role-policy"
  description = "Policy to EC2 access S3"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "${var.arn_s3}/*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.s3-role.name
  policy_arn = aws_iam_policy.s3-role-policy.arn
}