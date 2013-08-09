class Company < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :events
  has_many :users, through: :events
end
