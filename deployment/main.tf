// This is a template file for a basic deployment.
// Modify the parameters below with actual values
module "ck" {
  // location of the module - can be local or git repo
  source = "./modules/ck"

  # SNS
  ck_sns_email_endpoint = "yusuke@spiritgun.com"

  # - Cognito -
  # Admin Users to create
  ck_admin_cognito_users = {
    NarutoUzumaki : {
      username       = "nuzumaki"
      given_name     = "Naruto"
      family_name    = "Uzumaki"
      email          = "naruto@rasengan.com"
      email_verified = true // no touchy
    },
    SasukeUchiha : {
      username       = "suchiha"
      given_name     = "Sasuke"
      family_name    = "Uchiha"
      email          = "sasuke@chidori.com"
      email_verified = true // no touchy
    }
  }
  # Standard Users to create
  ck_standard_cognito_users = {
    DefaultStandardUser : {
      username       = "default"
      given_name     = "Default"
      family_name    = "User"
      email          = "example@example.com"
      email_verified = true // no touchy
    }
  }

}