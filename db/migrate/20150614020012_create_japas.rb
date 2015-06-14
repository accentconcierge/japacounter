class CreateJapas < ActiveRecord::Migration
  def change
    create_table :japas do |t|
      t.integer :rounds
      t.string :comment
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
