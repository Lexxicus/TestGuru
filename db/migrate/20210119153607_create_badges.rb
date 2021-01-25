class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image_name, null: false
      t.string :condition, null: false
      t.string :condition_value, null: false

      t.timestamps
    end
  end
end
