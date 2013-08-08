class Event < ActiveRecord::Base
  belongs_to :company, dependent: :destroy
  has_many :users
end
