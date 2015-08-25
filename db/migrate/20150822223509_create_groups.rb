class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :unique_id
      t.string :kind
      t.string :title
      t.boolean :isInstrumented

      t.timestamps null: false
    end
  end
end
