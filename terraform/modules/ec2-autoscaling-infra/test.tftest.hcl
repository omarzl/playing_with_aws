
variables {
  instance_type           = "t2.micro"
  ami_filter              = "al2023-ami-2023.4.20240513.0-kernel-6.1-x86_64"
  prefix                  = "test"
  vpc_id                  = ""
  key_name                = ""
  max_number_of_instances = 0
}

run "plan_executed" {
  command = plan
}