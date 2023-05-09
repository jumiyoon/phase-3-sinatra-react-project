class CreateKids < ActiveRecord::Migration[6.1]
  def change
    create_table :kids do |t|
      t.string :name
      t.integer :parent_id
      t.string :dietary_restrictions
      t.timestamps
    end
  end
end
