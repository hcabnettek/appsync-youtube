variable "ssh_key_private" {
  description = "Path to the private key used to access instances via ssh"
  type        = string
  default     = "/Users/christopherk/.ssh/bookstore-key.pem"
}

# SNS
variable "ck_enable_sns" {
  type = bool
  default = true
  description = "Conditional creation of SNS resources"

}
variable "ck_sns_email_endpoint" {
  type = string
  default = null
  description = "The Admin email address to be used for SNS subscription. Required if ck_enable_sns is set to 'true'"

}

# SSM
variable "lookup_ssm_github_access_token" {
  type        = bool
  default     = false
  description = <<-EOF
  *IMPORTANT!*
  Conditional data fetch of SSM parameter store for GitHub access token.
  To ensure security of this token, you must manually add it via the AWS console
  before using.
  EOF

}
variable "ssm_github_access_token_name" {
  type        = string
  default     = null
  description = "The name (key) of the SSM parameter store of your GitHub access token"

}

# - S3 -
variable "ck_landing_bucket_name" {
  type        = string
  default     = "ck-landing-bucket"
  description = "Name of the S3 bucket for audio file upload. Max 27 characters"
}
variable "ck_input_bucket_name" {
  type        = string
  default     = "ck-input-bucket"
  description = "Name of the S3 bucket for transcribe job source. Max 27 characters"
}
variable "ck_output_bucket_name" {
  type        = string
  default     = "ck-output-bucket"
  description = "Output bucket for completed transcriptions. Max 27 characters"
}
variable "ck_app_storage_bucket_name" {
  type        = string
  default     = "ck-app-storage-bucket"
  description = "Bucket used for Amplify app storage. Max 27 characters"
}
variable "create_ck_quicksight_bucket" {
  type        = bool
  default     = false
  description = "Conditional creation of QuickSight bucket"

}
variable "ck_quicksight_bucket_name" {
  type        = string
  default     = "quicksight-bucket"
  description = "Name of the QuickSight bucket. Max 27 characters"

}
variable "create_ck_s3_logging_bucket" {
  type        = bool
  default     = true
  description = "Conditional creation of S3 Logging bucket"

}
variable "ck_s3_logging_bucket_name" {
  type        = string
  default     = "ck-logs"
  description = "Name of bucket used for TCA logs. Max 27 characters"

}
# variable "create_ck_tf_remote_state_bucket" {
#   type        = bool
#   default     = true
#   description = "Conditional creation of S3 bucket to be used for Terraform Remote State"

# }
# variable "ck_tf_remote_state_bucket_name" {
#   type        = string
#   default     = "tca-tf-remote-state"
#   description = "Name of Terraform Remote State bucket. Max 27 characters"

# }
variable "s3_enable_force_destroy" {
  type    = string
  default = "true"

}
variable "ck_s3_enable_bucket_policy" {
  type        = bool
  default     = true
  description = "Conditional creation of S3 bucket policies"

}
variable "ck_s3_block_public_access" {
  type        = bool
  default     = true
  description = "Conditional enabling of the block public access S3 feature"

}
variable "ck_s3_block_public_acls" {
  type        = bool
  default     = true
  description = "Conditional enabling of the block public ACLs S3 feature"

}
variable "ck_s3_block_public_policy" {
  type        = bool
  default     = true
  description = "Conditional enabling of the block public policy S3 feature"

}
variable "ck_landing_bucket_enable_cors" {
  type        = bool
  default     = true
  description = "Contiditional enabling of CORS"

}
variable "ck_landing_bucket_create_nuke_everything_lifecycle_config" {
  type        = bool
  default     = true
  description = "Conditional create of the lifecycle config to remove all objects from the bucket"
}
variable "ck_landing_bucket_days_until_objects_expiration" {
  type        = number
  default     = 1
  description = "The number of days until objects in the bucket are deleted"
}

variable "ck_input_bucket_enable_cors" {
  type        = bool
  default     = true
  description = "Contiditional enabling of CORS"

}
variable "ck_input_bucket_create_nuke_everything_lifecycle_config" {
  type        = bool
  default     = true
  description = "Conditional create of the lifecycle config to remove all objects from the bucket"
}
variable "ck_input_bucket_days_until_objects_expiration" {
  type        = number
  default     = 1
  description = "The number of days until objects in the bucket are deleted"
}
variable "ck_output_bucket_enable_cors" {
  type        = bool
  default     = true
  description = "Contiditional enabling of CORS"

}
variable "ck_output_bucket_create_nuke_everything_lifecycle_config" {
  type        = bool
  default     = true
  description = "Conditional create of the lifecycle config to remove all objects from the bucket"

}
variable "ck_output_bucket_days_until_objects_expiration" {
  type        = number
  default     = 1
  description = "The number of days until objects in the bucket are deleted"
}

# variable "ck_quicksight_bucket_enable_cors" {
#   type        = bool
#   default     = true
#   description = "Contiditional enabling of CORS"

# }
# variable "ck_s3_logging_bucket_enable_cors" {
#   type        = bool
#   default     = true
#   description = "Contiditional enabling of CORS"

# }


# - Amplify -
variable "create_amplify_app" {
  type        = bool
  default     = true
  description = "Conditional creation of AWS Amplify Web Application"
}
variable "app_name" {
  type        = string
  default     = "TCA-App"
  description = "The name of the Amplify Application"
}
variable "ck_existing_repo_url" {
  type        = string
  default     = null
  description = "URL for the existing repo"

}
variable "github_access_token" {
  type        = string
  default     = null
  description = "Optional GitHub access token. Only required if using GitHub repo."

}
variable "ck_amplify_app_framework" {
  type    = string
  default = "React"

}
variable "create_ck_amplify_branch_main" {
  type        = bool
  default     = true
  description = "Conditional creation of main branch for amplify app"

}
variable "ck_amplify_branch_main_name" {
  type    = string
  default = "main"
}
variable "ck_amplify_branch_main_stage" {
  type    = string
  default = "PRODUCTION"

}
variable "create_ck_amplify_branch_dev" {
  type        = bool
  default     = true
  description = "Conditional creation of dev branch for amplify app"

}
variable "ck_amplify_branch_dev_name" {
  type    = string
  default = "dev"
}
variable "ck_amplify_branch_dev_stage" {
  type    = string
  default = "DEVELOPMENT"

}

variable "create_ck_amplify_domain_association" {
  type    = bool
  default = false

}
variable "ck_amplify_app_domain_name" {
  type        = string
  default     = "example.com"
  description = "The name of your domain. Ex. naruto.ninja"

}


# AppSync - GraphQL
variable "ck_appsync_graphql_api_name" {
  type    = string
  default = "tca-graphql-api"

}


# - Step Function -
variable "ck_sfn_state_machine_name" {
  type        = string
  default     = "tca-state-machine"
  description = "Name of the state machine used to orchestrate pipeline"

}

# - IAM -
# variable "create_full_access_roles" {
#   type        = bool
#   default     = false
#   description = "Conditional creation of TCA full access roles. Use this for testing purposes only."

# }
variable "create_restricted_access_roles" {
  type        = bool
  default     = true
  description = "Conditional creation of TCA restricted access roles"

}


# - DynamoDB -
variable "dynamodb_ttl_enable" {
  type    = bool
  default = false
}
variable "dynamodb_ttl_attribute" {
  type    = string
  default = "TimeToExist"
}
variable "ck_output_billing_mode" {
  type    = string
  default = "PROVISIONED"
}
variable "ck_output_read_capacity" {
  type    = number
  default = 20

}
variable "ck_output_write_capacity" {
  type    = number
  default = 20

}


# - Cognito -
# User Pool
variable "ck_user_pool_name" {
  type        = string
  default     = "ck_user_pool"
  description = "The name of the Cognito User Pool created"
}
variable "ck_user_pool_client_name" {
  type        = string
  default     = "ck_user_pool_client"
  description = "The name of the Cognito User Pool Client created"
}
variable "ck_identity_pool_name" {
  type        = string
  default     = "ck_identity_pool"
  description = "The name of the Cognito Identity Pool created"

}
variable "ck_identity_pool_allow_unauthenticated_identites" {
  type    = bool
  default = false
}
variable "ck_identity_pool_allow_classic_flow" {
  type    = bool
  default = false

}
variable "ck_email_verification_message" {
  type        = string
  default     = <<-EOF

  Thank you for registering with TCA. This is your email confirmation.
  Verification Code: {####}

  EOF
  description = "The Cognito email verification message"
}
variable "ck_email_verification_subject" {
  type        = string
  default     = "TCA Verification"
  description = "The Cognito email verification subject"
}
variable "ck_invite_email_message" {
  type    = string
  default = <<-EOF
    You have been invited to the TCA App! Your username is "{username}" and
    temporary password is "{####}". Please reach out to an admin if you have issues signing in.

  EOF

}
variable "ck_invite_email_subject" {
  type    = string
  default = <<-EOF
  You've been CHOSEN.
  EOF

}
variable "ck_invite_sms_message" {
  type    = string
  default = <<-EOF
    You have been invited to the TCA App! Your username is "{username}" and
    temporary password is "{####}".

  EOF

}
variable "ck_password_policy_min_length" {
  type        = number
  default     = 8
  description = "The minimum nmber of characters for Cognito user passwords"
}
variable "ck_password_policy_require_lowercase" {
  type        = bool
  default     = true
  description = "Whether or not the Cognito user password must have at least 1 lowercase character"

}
variable "ck_password_policy_require_uppercase" {
  type        = bool
  default     = true
  description = "Whether or not the Cognito user password must have at least 1 uppercase character"

}
variable "ck_password_policy_require_numbers" {
  type        = bool
  default     = true
  description = "Whether or not the Cognito user password must have at least 1 number"

}

variable "ck_password_policy_require_symbols" {
  type        = bool
  default     = true
  description = "Whether or not the Cognito user password must have at least 1 special character"

}

variable "ck_password_policy_temp_password_validity_days" {
  type        = number
  default     = 7
  description = "The number of days a temp password is valid. If user does not sign-in during this time, will need to be reset by an admin"

}
# General Schema
variable "ck_schemas" {
  description = "A container with the schema attributes of a user pool. Maximum of 50 attributes"
  type        = list(any)
  default     = []
}
# Schema (String)
variable "ck_string_schemas" {
  description = "A container with the string schema attributes of a user pool. Maximum of 50 attributes"
  type        = list(any)
  default = [{
    name                     = "email"
    attribute_data_type      = "String"
    required                 = true
    mutable                  = false
    developer_only_attribute = false

    string_attribute_constraints = {
      min_length = 7
      max_length = 25
    }
    },
    {
      name                     = "given_name"
      attribute_data_type      = "String"
      required                 = true
      mutable                  = true
      developer_only_attribute = false

      string_attribute_constraints = {
        min_length = 1
        max_length = 25
      }
    },
    {
      name                     = "family_name"
      attribute_data_type      = "String"
      required                 = true
      mutable                  = true
      developer_only_attribute = false

      string_attribute_constraints = {
        min_length = 1
        max_length = 25
      }
    },
    {
      name                     = "IAC_PROVIDER"
      attribute_data_type      = "String"
      required                 = false
      mutable                  = true
      developer_only_attribute = false

      string_attribute_constraints = {
        min_length = 1
        max_length = 10
      }
    },
  ]
}
# Schema (number)
variable "ck_number_schemas" {
  description = "A container with the number schema attributes of a user pool. Maximum of 50 attributes"
  type        = list(any)
  default     = []
}







# Admin Users
variable "ck_admin_cognito_users" {
  type    = map(any)
  default = {}

}
variable "ck_admin_cognito_user_group_name" {
  type    = string
  default = "Admin"

}
variable "ck_admin_cognito_user_group_description" {
  type    = string
  default = "Admin Group"

}
# Standard Users
variable "ck_standard_cognito_users" {
  type    = map(any)
  default = {}

}
variable "ck_standard_cognito_user_group_name" {
  type    = string
  default = "Standard"

}
variable "ck_standard_cognito_user_group_description" {
  type    = string
  default = "Standard Group"

}

# GitLab Mirroring

variable "ck_enable_gitlab_mirroring" {
  type        = bool
  default     = false
  description = "Enables GitLab mirroring to the option AWS CodeCommit repo."
}
variable "ck_gitlab_mirroring_iam_user_name" {
  type        = string
  default     = "ck_gitlab_mirroring"
  description = "The IAM Username for the GitLab Mirroring IAM User."
}
variable "ck_gitlab_mirroring_policy_name" {
  type        = string
  default     = "ck_gitlab_mirroring_policy"
  description = "The name of the IAM policy attached to the GitLab Mirroring IAM User"
}



# CodeCommit
variable "ck_create_codecommit_repo" {
  type    = bool
  default = true
}
variable "ck_codecommit_repo_name" {
  type    = string
  default = "ck_codecommit_repo"
}
variable "ck_codecommit_repo_description" {
  type    = string
  default = "The CodeCommit repo created by TCA"
}
variable "ck_codecommit_repo_default_branch" {
  type    = string
  default = "main"

}


#  - Step Function -
# State Management
# GenerateUUID
variable "ck_sfn_state_generate_uuid_name" {
  type        = string
  default     = "GenerateUUID"
  description = "Name for SFN State that generates a UUID that is appended to the object key of the file copied from ck_landing to ck_input bucket"

}
# variable "ck_sfn_state_generate_uuid_type" {
#   type        = string
#   default     = "Pass"
#   description = "Pass state type"

# }
variable "ck_sfn_state_generate_uuid_next_step" {
  type    = string
  default = "GetTCAInputFile"

}

# GetTCAInputFile
variable "create_ck_sfn_state_get_ck_input_file" {
  type        = bool
  default     = true
  description = "Enables creation of GetTCAInputFile sfn state"

}
variable "ck_sfn_state_get_ck_input_file_name" {
  type        = string
  default     = "GetTCAInputFile"
  description = "Generates a UUID that is appended to the object key of the file copied from ck_landing to ck_input bucket"

}
variable "ck_sfn_state_get_ck_input_file_next_step" {
  type    = string
  default = "StartCallAnalyticsJob"

}

# StartCallAnalyticsJob
variable "ck_sfn_state_start_call_analytics_job_name" {
  type        = string
  default     = "StartCallAnalyticsJob"
  description = "Generates a UUID that is appended to the object key of the file copied from ck_landing to ck_input bucket"

}

variable "ck_sfn_state_start_call_analytics_job_next_step" {
  type    = string
  default = "Wait20Seconds"

}



# Content Redaction
variable "ck_enable_content_redaction" {
  type        = bool
  default     = false
  description = "Enables the content redaction feature of Amazon Transcribe Call Analytics"
}
variable "ck_use_redaction_type_redacted_and_unredacted" {
  type        = bool
  default     = true
  description = "Sets the RedactionType to either 'redacted_and_unredacted' (default) or 'redacted'"
}
variable "ck_pii_entity_types" {
  type        = list(string)
  default     = []
  description = <<EOF
  Sets which types of PII you want to redact in your transcript. You can include as
  many as you'd like, or you can select 'ALL' (default).
  Acceptable values are:
  'BANK_ACCOUNT_NUMBER','BANK_ROUTING','CREDIT_DEBIT_NUMBER','CREDIT_DEBIT_CVV'
  ,'CREDIT_DEBIT_EXPIRY','PIN','EMAIL','ADDRESS','NAME','PHONE','SSN','ALL'
EOF
}

# Language Options
variable "ck_language_options" {
  type        = list(any)
  default     = ["en-US"]
  description = <<EOF
    List of language codes for languages you thinkg may be present in your media.
    Default is 'en-US.' Including more than 5 is not recommended.
  EOF

}

# Custom Vocabulary
variable "ck_use_custom_vocabulary" {
  type        = bool
  default     = false
  description = "Enables the use of a custom vocabulary in your job"
}
variable "ck_custom_vocabulary_name" {
  type        = string
  default     = null
  description = <<EOF
    The name of the custom vocabulary you want to include in your Call Analytics
    transcription request. Vocabulary names are case sensitive.
  EOF

}
variable "ck_use_custom_vocabulary_filter" {
  type        = bool
  default     = false
  description = "Enables the use of a custom vocabulary filter in your job"
}
variable "ck_custom_vocabulary_filter_name" {
  type        = string
  default     = null
  description = <<EOF
    The name of the custom vocabulary filter you want to include in your Call Analytics
    transcription request. Vocabulary filter names are case sensitive. Note that if you
    include 'VocabularyFilterName' in your request, you must also include 'VocabularyFilterMethod'.
  EOF

}

# Custom Language Model
variable "ck_use_custom_language_model" {
  type        = bool
  default     = false
  description = "Enables the use of a custom language model in your job"

}
variable "ck_custom_language_model_name" {
  type        = string
  default     = null
  description = <<EOF
    Specify how you want your vocabulary filter applied to your transcript.
    To replace words with '***' , choose 'mask' .
    To delete words, choose 'remove' .
    To flag words without changing them, choose 'tag' .
  EOF

}

# Language ID Settings
variable "ck_use_language_id_settings" {
  type        = bool
  default     = false
  description = <<EOF
    Enables the use of LanguageIdSettings in your job.
    More info here: https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/transcribe.html
  EOF

}

variable "ck_first_speaker_participant_role" {
  type    = string
  default = "AGENT"

}
variable "ck_second_speaker_participant_role" {
  type    = string
  default = "CUSTOMER"

}








variable "tags" {
  type        = map(any)
  description = "Tags to apply to resources"
  default = {
    "IAC_PROVIDER" = "Terraform"
  }
}
