class Group < ActiveRecord::Base
  has_many :spaces, dependent: :destroy
  has_many :location, dependent: :destroy
  validates :title, presence: true
end
