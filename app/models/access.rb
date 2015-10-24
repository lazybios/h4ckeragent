class Access < ActiveRecord::Base
  belongs_to :user
  belongs_to :resume

  before_create { generate_token(:passcode, 10); generate_token(:sharecode, 4) }


  def generate_token(column, n)
    begin
      self[column] = SecureRandom.urlsafe_base64(n)
    end while Access.exists?(column => self[column])
  end

end
