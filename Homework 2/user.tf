resource "aws_iam_user" "lb" {
    for_each = toset(["jihyo", "sana", "momo", "dahyun"])
    name = each.value
}

resource "aws_iam_group_membership" "team" {
  name = "twice"

  users = [
    for i in aws_iam_user.lb : i.name
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "twice"
}


