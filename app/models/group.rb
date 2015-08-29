require 'open-uri'

class Group < ActiveRecord::Base
  has_many :spaces, dependent: :destroy
  has_many :location, dependent: :destroy
  validates :title, presence: true

  def avaliable_spaces
    url =JSON.load(open('http://parker2.api.streetlinenetworks.com/api/testing/availability/f3/la/availability.json?decode=true'))
    availability= url["availability"]["availabilityBitsDecoded"]

    spaces = Space.where(group_id: self.id)
    open =  0
    spaces.each{|space| 
      space_id = space["unique_id"] - 1
      if availability[space_id] == '1'
        open += 1 
      end
    }
    return open
  end

  def spaces 
    return spaces = Space.where(group_id: self.id)
  end


end
