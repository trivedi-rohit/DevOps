## Key value pair 

resource "aws_key_pair" "my_key_pair" { 
key_name = "${var.env}-terra-automate-key"
public_key=file("${path.module}/terra-automate-key.pub") 
} 

# VPC Default 

resource "aws_default_vpc" "default" { 

} 

# Security Group 

resource "aws_security_group" "my_security_group" { 

name = "${var.env}-terra-security-group" 

# interpolatin (use of VPC_id from VPC Default) 

vpc_id = aws_default_vpc.default.id 

description = "This  is Inbound & Outbound rules for your instance Security Group"  

} 

# Inbound & Outbound port rules: 

resource "aws_vpc_security_group_ingress_rule" "allow_http" { 
security_group_id = aws_security_group.my_security_group.id 
cidr_ipv4         = "0.0.0.0/0" 
from_port         = 80 
ip_protocol       = "tcp" 
to_port           = 80 
} 

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" { 
security_group_id = aws_security_group.my_security_group.id 
cidr_ipv4         = "0.0.0.0/0" 
from_port         = 22 
ip_protocol       = "tcp" 
to_port           = 22 
} 

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" { 
security_group_id = aws_security_group.my_security_group.id 
cidr_ipv4         = "0.0.0.0/0" 
ip_protocol       = "-1" # semantically equivalent to all ports 
} 
 
# EC2 instance 

resource aws_instance my_instance { 
count = var.ec2_instance_count
ami = var.ec2_ami_id       # AMI ID 
instance_type = var.ec2_instance_type
key_name = aws_key_pair.my_key_pair.key_name      # key pair 
vpc_security_group_ids = [aws_security_group.my_security_group.id]        #vpc & security group 

# root storage (EBS) 

root_block_device { 
volume_size = var.ec2_instance_size 
volume_type = "gp3"  
} 

tags = { 
Name = "${var.env}-${var.ec2_instance_name}"
Environment = var.env
}
} 

