class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.integer :policy
      t.boolean :metered
      t.boolean :instrumented
      t.boolean :creditcard
      t.boolean :coin
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
