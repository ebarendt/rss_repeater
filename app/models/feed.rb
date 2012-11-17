class Feed < ActiveRecord::Base

  belongs_to :user

  attr_accessible :password, :public_url, :url, :username

end
