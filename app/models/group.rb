class Group < ActiveRecord::Base
  has_many :spaces
  has_many :location
  validates :title, presence: true
end
