# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

json = ActiveSupport::JSON.decode(File.read('db/Streetline.json'))

def setupLocation(location, group_id)
  latitude        = location["latitude"] 
  longitude       = location["longitude"] 
  latitudeDelta   = location["latitudeDelta"] 
  longitudeDelta  = location["longitudeDelta"] 

  dbLocation = Location.create(latitude: latitude, longitude: longitude, latitude_delta: latitudeDelta, longitude_delta: longitudeDelta, group_id: group_id)
  puts dbLocation
end

def setupSpace(space)
  if space
    unique_id  = space["id"]
    policy     = space["policyGroupID"]
    metered    = space["isMetered"]
    creditcard = space["creditCardsAccepted"]
    coin       = space["coinsAccepted"]

    dbSpace = Space.create(unique_id: unique_id, policy: policy, metered: metered, creditcard: creditcard, coin: coin)
    puts dbSpace
  else
    dbSpace = Space.create
    puts dbSpace
  end

end

def setupGroup(group)
  id             = group["id"]
  kind           = group["kind"]
  title          = group["title"]
  isInstrumented = group["isInstrumented"]
  spaces         = group["parkingSpaceIds"]
  
  dbGroup = Group.create(unique_id: id, kind: kind, title: title, isInstrumented: isInstrumented)
  
  if group["mapRegion"]
    location = setupLocation(group["mapRegion"], dbGroup['id'])
  else
    location = setupLocation(group["location"], dbGroup['id'])
  end

  if spaces
    spaces.each{|space_id| 
      space             = Space.find_by(unique_id: space_id)
      space['group_id'] = dbGroup['id']
      space.save
    }
  end

  puts dbGroup
end

json['parkingRegion']['spaces'].each{|space|
  setupSpace(space)
}

json['parkingRegion']['spaceGroups'].each{|group|
  setupGroup(group)
}
# setupSpace(json['parkingRegion']['spaces'][0])
# setupGroup(json['parkingRegion']['spaceGroups'][0])

# json['parkingRegion']['spaceGroups'].each do |group|
#   bar(group)
# end



