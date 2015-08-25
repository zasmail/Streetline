class AddGroupAsReferenceToLocationTryAgain < ActiveRecord::Migration
  def change
    add_column :locations, :group_id, :integer
    add_index :locations, :group_id
  end
end
