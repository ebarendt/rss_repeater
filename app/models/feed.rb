class Feed < ActiveRecord::Base

  belongs_to :user

  attr_accessible :password, :public_url, :url, :username

  validates_presence_of :url
end
