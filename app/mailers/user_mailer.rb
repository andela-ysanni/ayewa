class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_verification.subject
  #
  def account_verification(user)
    @user = user
    mail to: "#{@user.email}", subject: "Account Verification"
  end
end
