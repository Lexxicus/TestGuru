class AddNullConstraint < ActiveRecord::Migration[6.0]
  def up
    change_column_null(:questions, :body, false)
    change_column_null(:users, :name, false)
    change_column_null(:categories, :title, false)
  end

  def down
    change_column_null(:questions, :body, true)
    change_column_null(:users, :name, true)
    change_column_null(:categories, :title, true)
  end
end
