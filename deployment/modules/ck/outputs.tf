# AWS Current Region
output "aws_current_region" {
  value = data.aws_region.current

}

# S3
output "ck_input_bucket_id" {
  value       = aws_s3_bucket.ck_input_bucket
  description = "The name of the S3 input bucket"
}
output "ck_input_bucket_arn" {
  value       = aws_s3_bucket.ck_input_bucket
  description = "The Arn of the S3 input bucket"
}
output "ck_output_bucket_id" {
  value       = aws_s3_bucket.ck_output_bucket
  description = "The name of the S3 output bucket"
}
output "ck_output_bucket_arn" {
  value       = aws_s3_bucket.ck_output_bucket
  description = "The Arn of the S3 input bucket"
}
output "ck_app_storage_bucket_id" {
  value       = aws_s3_bucket.ck_app_storage_bucket
  description = "The name of the S3 app storage bucket"
}
output "ck_app_storage_bucket_arn" {
  value       = aws_s3_bucket.ck_app_storage_bucket
  description = "The ARN of the S3 app storage bucket"
}
output "ck_quicksight_bucket_id" {
  value       = var.create_ck_quicksight_bucket ? aws_s3_bucket.ck_quicksight_bucket : null
  description = "The name of the S3 app storage bucket"
}
output "ck_quicksight_bucket_arn" {
  value       = var.create_ck_quicksight_bucket ? aws_s3_bucket.ck_quicksight_bucket : null
  description = "The ARN of the S3 app storage bucket"
}
output "ck_s3_logging_bucket_id" {
  value       = var.create_ck_s3_logging_bucket ? aws_s3_bucket.ck_s3_logging_bucket : null
  description = "The name of the S3 logging bucket"
}
output "ck_s3_logging_bucket_arn" {
  value       = aws_s3_bucket.ck_s3_logging_bucket
  description = "The ARN of the S3 logging bucket"
}

# Amplify

# Step Function
output "ck_step_function_arn" {
  value = aws_sfn_state_machine.ck_sfn_state_machine.arn

}

# IAM

# DynamoDB
output "ck_dynamodb_output_table_name" {
  value = aws_dynamodb_table.ck_output.name
}



# Cognito
output "ck_user_pool_region" {
  value = data.aws_region.current
}
output "ck_user_pool_id" {
  value = aws_cognito_user_pool.ck_user_pool
}
output "ck_user_pool_client_id" {
  value = aws_cognito_user_pool_client.ck_user_pool_client
}
output "ck_identity_pool_id" {
  value = aws_cognito_identity_pool.ck_identity_pool
}


# AppSync (GraphQL)
output "ck_appsync_graphql_api_region" {
  value = data.aws_region.current
}
output "ck_appsync_graphql_api_id" {
  value = aws_appsync_graphql_api.ck_appsync_graphql_api
}
output "ck_appsync_graphql_api_uris" {
  value = aws_appsync_graphql_api.ck_appsync_graphql_api
}
