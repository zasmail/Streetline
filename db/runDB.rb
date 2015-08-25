require 'json'

class TestClass
  def self.bar(index)
    # json = ActiveSupport::JSON.decode(File.read('db/Streetline.json'))
    

    sg = json['parkingRegion']['spaceGroups'][index]
    id = sg["id"]
    kind = sg["kind"]
    title = sg["title"]
    isInstrumented = sg["isInstrumented"]
    group = Group.create(unique_id: id, kind: kind, title: title, isInstrumented: isInstrumented)
    puts group
    return group
  end
end

TestClass.bar(0)