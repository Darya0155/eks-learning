resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks_cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [aws_subnet.eks_vpc_subnet_1.id, aws_subnet.eks_vpc_subnet_2.id]
    endpoint_private_access = true
    endpoint_public_access = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.EKS_cluster_role_policy_attachment2,
    aws_iam_role_policy_attachment.EKS_cluster_role_policy_attachment
  ]

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

}




resource "aws_eks_node_group" "eks_node_group" {
  instance_types = ["t3.medium"]
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = [aws_subnet.eks_vpc_subnet_2.id, aws_subnet.eks_vpc_subnet_1.id]

  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
  remote_access {
    ec2_ssh_key = "eks-demo"  # Replace with your SSH key name
    source_security_group_ids = [aws_security_group.eks_secrutiy_group.id]  # Replace with your security group IDs
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_nodegroup_role_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_nodegroup_role_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_nodegroup_role_AmazonEC2ContainerRegistryReadOnly,
  ]
  capacity_type = "SPOT"
}