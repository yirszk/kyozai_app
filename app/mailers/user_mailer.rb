class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "アカウントの作成 | 教材比較.COM"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "パスワード再設定 | 教材比較.COM"
  end
end