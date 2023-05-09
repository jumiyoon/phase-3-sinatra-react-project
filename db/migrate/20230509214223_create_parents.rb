class CreateParents < ActiveRecord::Migration[6.1]
  def change
    create_table :parents do |t|
      t.string :family_name
      t.integer :phone
      t.string :service_time
      t.timestamps
    end
  end
end
