# Optional - Only necessary if you want a full Amplify App running in AWS (not just localhost)

resource "aws_codecommit_repository" "ck_codecommit_repo" {
  count           = var.ck_create_codecommit_repo ? 1 : 0
  repository_name = var.ck_codecommit_repo_name
  description     = var.ck_codecommit_repo_description
  default_branch  = var.ck_codecommit_repo_default_branch

  tags = merge(
    {
      "AppName" = var.app_name
    },
    var.tags,
  )
}
