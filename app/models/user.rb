class User < ActiveRecord::Base
  # has_many :gifts

  validates_presence_of :email
end
