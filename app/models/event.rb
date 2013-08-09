class Event < ActiveRecord::Base
  validates_uniqueness_of :title
  belongs_to :company, dependent: :destroy
  has_many :users
end