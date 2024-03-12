class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :role
      t.text :overview
      t.integer :view_count
      t.string :bio

      t.timestamps
    end
  end
end
