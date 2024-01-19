module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.medium"
  key_name               = "latest_key"
  monitoring             = true
  vpc_security_group_ids = ["sg-0228d1e3fdffc59ef"]
  subnet_id              = "subnet-0fc306dc92a149862"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}