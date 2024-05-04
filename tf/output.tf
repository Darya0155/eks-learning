output "endpoint" {
  value={
    endpoint = aws_eks_cluster.eks_cluster.endpoint
    kubeconfig-certificate-authority-data= aws_eks_cluster.eks_cluster.certificate_authority[0].data
    node_group_remote_access=aws_eks_cluster.eks_cluster.vpc_config
  }
}