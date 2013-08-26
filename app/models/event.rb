class Event < ActiveRecord::Base
  validates_uniqueness_of :title
  belongs_to :company, dependent: :destroy
  has_many :users
  has_many :comments, -> { where order: 'upvotes' }
  has_many :commenters, through: :comments, source: :user
end