class Notifier < ActionMailer::Base
  default_url_options[:host] = "www.example.com"
  
  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "#{AUTHENTICATION_CONFIG[:sender_name]} <#{AUTHENTICATION_CONFIG[:sender_email]}>"
    # from          "User Notifier <yourname@example.com>"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end
end