
resource "aws_iam_role" "ssm_role" {
  name = "${local.prefix}_ssm_role"
  path = "/"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : {
      "Sid" : "AllowSSMSesionManager"
      "Effect" : "Allow",
      "Principal" : { "Service" : "ssm.amazonaws.com" },
      "Action" : "sts:AssumeRole"
    }
  })
}

resource "aws_ssm_activation" "ssm_attach" {
  name               = "ssm_activation"
  description        = "Activate SSM on EC2"
  iam_role           = aws_iam_role.ssm_role.id
  registration_limit = "5"
  depends_on         = [aws_iam_role_policy_attachment.ssm_attach]
}

resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ec2_attach" {
  role       = aws_iam_role.ec2_role.name
  count      = length(local.instance_role_managed_policies)
  policy_arn = local.instance_role_managed_policies[count.index]
}

locals {
  instance_role_managed_policies = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}

resource "aws_iam_instance_profile" "ssm_inst_profile" {
  name = "ios_ec2_role"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role" "ec2_role" {
  name = "ios_ec2_role"
  path = "/"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : {
      "Sid" : "AllowSSMSesionManager"
      "Effect" : "Allow",
      "Principal" : { "Service" : "ec2.amazonaws.com" },
      "Action" : "sts:AssumeRole"
    }
  })
}
