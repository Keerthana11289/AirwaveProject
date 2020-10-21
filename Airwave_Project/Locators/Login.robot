*** Variables ***
${login_username_id}    login-username-id
${login_password_id}    login-password-id
${login_button_id}    login-button
#${login_empty_error_message}    This field cannot be empty
${login_invalid_credentials_error_message}    Invalid credentials.
${login_username_required_error_message}    Username is a required field.
${login_password_required_error_message}    Password is a required field.
${login_both_fields_required_error_message}    Username is a required field.Password is a required field.
${login_error_message_div_id}    //*[contains(@id,'login-failed')]
${logout_link_id}  app-menu-logout