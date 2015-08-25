class AddGroupAsReferenceToLocation < ActiveRecord::Migration
  def change
    add_foreign_key :locations, :groups
  end
end
