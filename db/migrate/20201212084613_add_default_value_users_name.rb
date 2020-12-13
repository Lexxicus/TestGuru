class AddDefaultValueUsersName < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :name, "User#{Time.now}"
  end
end
