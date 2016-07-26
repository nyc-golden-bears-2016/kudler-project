class User < ActiveRecord::Base
   include BCrypt

  has_many :reviews
  has_many :votes


  validates :username, uniqueness: true, presence: true
  validates :password_digest, presence: {message: "Password can't be blank"}


  has_secure_password



 def self.authenticate(email, password)
    user = User.find_by(username: email)
    if user && user.password == password
      return user
    else
      return nil
    end
  end


end
