ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  #テストユーザーがログイン中の場合にtrueを返す
  def is_logged_in?
    !session[:user_id].nil?
  end

  # テストユーザーとしてログインする
  # tutorial通りにやっても上手く行かないため、以下を参考に修正
  # https://stackoverflow.com/questions/44461101/accessing-session-in-integration-test
  def log_in_as(user, password: 'password')
    post login_path, params: { session: { email: user.email, password: password} }
  end

end
