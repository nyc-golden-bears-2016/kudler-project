class User < ActiveRecord::Base
   include BCrypt


  validates :name, uniqueness: true, presence: true
  validates :password_digest, presence: {message: "Password can't be blank"}

  after_initialize :init


  has_secure_password



 def self.authenticate(email, password)
    user = User.find_by(username: email)
    if user && user.password == password
      return user
    else
      return nil
    end
  end

  def init
    self.lifestyle_type ||= "blank"
  end



end
