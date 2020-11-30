class CreateUserTests < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tests do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.boolean :finished, default: false

      t.timestamps
    end
  end
end
