resource "aws_security_group" "eks_secrutiy_group" {
  name        = "allowAlltraffic"
  vpc_id      = aws_vpc.eks_vpc.id
  tags = {
    Name = "aws_mks_connect_demo"
  }
}



resource "aws_vpc_security_group_ingress_rule" "allow_all_in_ipv4_2" {
  security_group_id = aws_security_group.eks_secrutiy_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_3" {
  security_group_id = aws_security_group.eks_secrutiy_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}