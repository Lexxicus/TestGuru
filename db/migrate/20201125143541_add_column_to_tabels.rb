class AddColumnToTabels < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :category_id, :int
    add_column :questions, :test_id, :int
    add_column :answers, :body, :string
    add_column :answers, :question_id, :int
    add_foreign_key :tests, :categories
    add_foreign_key :questions, :tests
    add_foreign_key :answers, :questions
  end
end
