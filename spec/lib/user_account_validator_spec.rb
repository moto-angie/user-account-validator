require 'spec_helper'
require_relative'/Users/angie/Dropbox/challenges/Phase6/user-account-validator/lib/user_account_validator.rb'

RSpec.describe UserAcctErrors do

  it 'Does not raise exception with complete and accurate data' do
    user_set_1 = [
      {
        email: "one@email.com",
        username: "one",
        name: "One"
      },
      {
        email: "two@email.com",
        username: "two",
        name: "Two"
      },
    ]
    expect {user_set_1.map { |user| UserAccountValidator.new(user)}}.not_to raise_error
  end

  it 'Raises UserAcctErrors error when email is missing' do
    user_set_2 = [
      {
        email: "two@email.com",
        username: "two",
        name: "Two"
      },
      {
        email: nil,
        username: "three",
        name: "Three"
      }
    ]
    expect {user_set_2.map { |user|UserAccountValidator.new(user)}}.to raise_exception(UserAcctErrors)
  end
end
