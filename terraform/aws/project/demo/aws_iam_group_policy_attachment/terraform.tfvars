aws_iam_group_policy_attachment = [
  {
    group      = "admin"
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  },
  {
    group      = "developer"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  },
  {
    group      = "developer"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  },
  {
    group      = "developer"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  },
  {
    group      = "developer"
    policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  },
  {
    group      = "release"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  },
  {
    group      = "release"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  },
  {
    group      = "release"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  },
]
