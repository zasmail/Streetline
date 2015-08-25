class AddIndexToGroupKind < ActiveRecord::Migration
  def change
    add_index :groups, :kind
  end
end
