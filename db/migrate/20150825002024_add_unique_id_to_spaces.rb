class AddUniqueIdToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :unique_id, :integer
  end
end
