class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.references :user, null: false, foreign_key: true, index: true, unique: true
      t.references :question, null: false, foreign_key: true, index: true, unique: true
      t.string :html_url
      t.string :git_id

      t.timestamps
    end
  end
end
