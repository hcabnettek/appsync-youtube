#  TODO - Create SNS notification for and failed jobs




resource "aws_sns_topic" "ck_sfn_status" {
  # count = var.ck_enable_sns ? 1 : 0
  name = "ck_sfn_status"
}

# resource "aws_sns_topic_policy" ck_sfn_status" {
# count = var.ck_enable_sns ? 1 : 0
#   arn = aws_sns_topic.ck_sfn_status.arn

#   policy = data.aws_iam_policy_document.sns_topic_policy.json
# }

# data "aws_iam_policy_document" "ck_sfn_status_sns_topic_policy" {
#   policy_id = "__default_policy_ID"

#   statement {
#     actions = [
#       # "SNS:Subscribe",
#       # "SNS:SetTopicAttributes",
#       # "SNS:RemovePermission",
#       # "SNS:Receive",
#       "SNS:Publish",
#       # "SNS:ListSubscriptionsByTopic",
#       # "SNS:GetTopicAttributes",
#       # "SNS:DeleteTopic",
#       # "SNS:AddPermission",
#     ]

#     # condition {
#     #   test     = "StringEquals"
#     #   variable = "AWS:SourceOwner"

#     #   values = [
#     #     var.account-id,
#     #   ]
#     # }

#     effect = "Allow"

#     principals {
#       type        = "Service"
#       identifiers = ["events.amazonaws.com"]
#     }

#     resources = [
#       aws_sns_topic.ck_sfn_status.arn,
#     ]

#     sid = "__default_statement_ID"
#   }
# }

// IMPORTANT - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription
resource "aws_sns_topic_subscription" "ck_sfn_status_sqs_target" {
  # count     = var.ck_enable_sns ? 1 : 0
  topic_arn = aws_sns_topic.ck_sfn_status.arn
  protocol  = "email"
  # protocol  = "email-json"
  endpoint = var.ck_sns_email_endpoint
}
