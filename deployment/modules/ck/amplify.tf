# Relevant values:
# - AWS Region
# - Cognito User Pool ID
# - Cognito Web Client ID
# - Cognito Identity Pool ID
# - AppSync GraphQL Region
# - AppSync GraphQL Endpoint ID
# - AppSync GraphQL Authentication Type ('AMAZON_COGNITO_USER_POOLS')
# - Relevant S3 Buckets

resource "aws_amplify_app" "ck_app" {
  count                    = var.create_amplify_app ? 1 : 0
  name                     = var.app_name
  repository               = var.ck_create_codecommit_repo ? aws_codecommit_repository.ck_codecommit_repo[0].clone_url_http : var.ck_existing_repo_url
  enable_branch_auto_build = true

  # OPTIONAL - Necessary if not using oauth_token or access_token (used for GitLab and GitHub repos)
  iam_service_role_arn = aws_iam_role.ck_amplify_codecommit.arn
  access_token         = var.lookup_ssm_github_access_token ? data.aws_ssm_parameter.ssm_github_access_token[0].name : var.github_access_token // optional, only needed if using github repo

  build_spec = file("${path.root}/../amplify.yml")
  # Redirects for Single Page Web Apps (SPA)
  # https://docs.aws.amazon.com/amplify/latest/userguide/redirects.html#redirects-for-single-page-web-apps-spa
  custom_rule {
    source = "</^[^.]+$|\\.(?!(css|gif|ico|jpg|js|png|txt|svg|woff|ttf|map|json)$)([^.]+$)/>"
    status = "200"
    target = "/index.html"
  }

  environment_variables = {
    CK_REGION              = "${data.aws_region.current.id}"
    CK_CODECOMMIT_REPO_ID  = "${aws_codecommit_repository.ck_codecommit_repo[0].repository_id}"
    CK_USER_POOL_ID        = "${aws_cognito_user_pool.ck_user_pool.id}"
    CK_IDENTITY_POOL_ID    = "${aws_cognito_identity_pool.ck_identity_pool.id}"
    CK_APP_CLIENT_ID       = "${aws_cognito_user_pool_client.ck_user_pool_client.id}"
    CK_GRAPHQL_ENDPOINT    = "${aws_appsync_graphql_api.ck_appsync_graphql_api.uris.GRAPHQL}"
    CK_GRAPHQL_API_ID      = "${aws_appsync_graphql_api.ck_appsync_graphql_api.id}"
    CK_LANDING_BUCKET_NAME = "${aws_s3_bucket.ck_landing_bucket.id}"
  }
}


resource "aws_amplify_branch" "ck_amplify_branch_main" {
  count       = var.create_ck_amplify_branch_main ? 1 : 0
  app_id      = aws_amplify_app.ck_app[0].id
  branch_name = var.ck_amplify_branch_main_name

  framework = var.ck_amplify_app_framework
  stage     = var.ck_amplify_branch_main_stage

  environment_variables = {
    Env = "prod"
  }
}

resource "aws_amplify_branch" "ck_amplify_branch_dev" {
  count       = var.create_ck_amplify_branch_dev ? 1 : 0
  app_id      = aws_amplify_app.ck_app[0].id
  branch_name = var.ck_amplify_branch_dev_name

  framework = var.ck_amplify_app_framework
  stage     = var.ck_amplify_branch_dev_stage

  environment_variables = {
    ENV = "dev"
  }
}


resource "aws_amplify_domain_association" "example" {
  count       = var.create_ck_amplify_domain_association ? 1 : 0
  app_id      = aws_amplify_app.ck_app[0].id
  domain_name = var.ck_amplify_app_domain_name

  # https://example.com
  sub_domain {
    branch_name = aws_amplify_branch.ck_amplify_branch_main[0].branch_name
    prefix      = ""
  }

  # https://www.example.com
  sub_domain {
    branch_name = aws_amplify_branch.ck_amplify_branch_main[0].branch_name
    prefix      = "www"
  }
  # https://dev.example.com
  sub_domain {
    branch_name = aws_amplify_branch.ck_amplify_branch_dev[0].branch_name
    prefix      = "dev"
  }
  # https://www.dev.example.com
  sub_domain {
    branch_name = aws_amplify_branch.ck_amplify_branch_dev[0].branch_name
    prefix      = "www.dev"
  }
}
