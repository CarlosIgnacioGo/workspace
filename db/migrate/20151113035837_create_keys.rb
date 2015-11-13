class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :title
      t.string :link
      t.string :user
      t.string :password
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
