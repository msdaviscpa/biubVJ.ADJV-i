require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "ABCdefghi123@#", password_confirmation: "ABCdefghi123@#")
  end
  
 test "email validation should accept valid addresses" do
   valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
                         
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
     invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
     ]
     
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
   test "password validation should accept valid passwords" do
   valid_passwords = %w[ABCdefghi123@# +-56fghtyU Ab34567$ Ab345_67$
   ]
                         
    valid_passwords.each do |valid_password|
      @user.password = @user.password_confirmation = valid_password
      assert @user.valid?, "#{valid_password.inspect} must contain one uppercase letter, one lowercase letter, one number, and one non-alphanumeric charachter"
    end
  end

test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
  test "password validation should reject invalid passwords" do
     invalid_passwords = %w[Ab3$ Abcdefg8 Abcdefg$ abcdefg8* abcdefg8.
     ]
     
    invalid_passwords.each do |invalid_password|
      @user.password = @user.password_confirmation = invalid_password
      assert_not @user.valid?, "#{invalid_password.inspect} should be invalid"
    end
  end

  
  
  
end
