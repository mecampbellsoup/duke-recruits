class Authentication < ActiveRecord::Base
  devise :omniauthable
  belongs_to :user
end
