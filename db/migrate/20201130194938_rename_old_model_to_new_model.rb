class RenameOldModelToNewModel < ActiveRecord::Migration[6.0]
  def change
    remove_index :user_tests, :test_id
    remove_index :user_tests, :user_id
    rename_table :user_tests, :tests_users
    add_index :tests_users, :test_id
    add_index :tests_users, :user_id
  end
end
