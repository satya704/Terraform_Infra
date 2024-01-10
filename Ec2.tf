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
  user_data = <<EOF
        #!/bin/bash
        sudo yum update -y
        sudo yum install httpd.x86_64 -y
        systemctl restart httpd.service
        systemctl enable httpd.service
        echo '<!DOCTYPE html>' > /var/www/html/index.html
        echo '<html lang="en">' >> /var/www/html/index.html
        echo '<body style="background-color:black;">' >> /var/www/html/index.html
        echo '  <h1 style="color:red;"> Welcome To Microland: HTTP access successfully configured!</h1>' >> /var/www/html/index.html
        echo '</body>' >> /var/www/html/index.html
        echo '</html>' >> /var/www/html/index.html
	EOF
}