class UserAcctErrors < StandardError
end

class UserAccountValidator

  attr_reader :email, :username, :name

  def initialize(users)
    @email = users[:email]
    @username = users[:username]
    @name = users[:name]
    validate
  end

  def validate
    if @email == nil
      # raise "Email is required"
      raise UserAcctErrors
    elsif !@email.include?("@")
      raise "Please enter a valid email address"
    end

    if @username == nil
      raise "Username is required"
    end
  end
end
