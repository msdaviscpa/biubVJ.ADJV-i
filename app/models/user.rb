class User < ApplicationRecord
  
  before_save { self.name = name.downcase }
  before_save { self.email = email.downcase }
  
  validates :name,  presence: true
  
  
  VALID_EMAIL_REGEX = /[\w+\-.]+@+[a-z\d\-.]+\.+[a-z]/i
   validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  
  # validates :email, presence: true, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # http://www.rubular.com/ https://regexr.com/3bfsi
  #validates :password, presence: true, format: /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!-/:-@[-`{-~]).{8,}/


VALID_PASSWORD_REGEX = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}/m

validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
  
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
  
  has_secure_password
end
