class CreateUserTests < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tests do |t|
      t.belongs_to :user
      t.belongs_to :test
      t.boolean :finished, default: false

      t.timestamps
    end
  end
end
