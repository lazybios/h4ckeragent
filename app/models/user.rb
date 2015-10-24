class User < ActiveRecord::Base
  has_secure_password

  has_many :accesses, :dependent => :destroy
  has_many :resumes, :dependent => :destroy

  before_create { generate_token(:token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
