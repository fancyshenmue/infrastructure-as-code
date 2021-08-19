aws_iam_group_membership = [
  {
    name  = "admin"
    group = "admin"
    users = [
      "admin-demo",
      "admin-demo2",
    ]
  },
  {
    name  = "developer"
    group = "developer"
    users = [
      "dev-demo",
    ]
  },
  {
    name  = "release"
    group = "release"
    users = [
      "release-demo"
    ]
  },
]
