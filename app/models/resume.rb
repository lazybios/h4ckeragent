class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :accesses, :dependent => :destroy
end
