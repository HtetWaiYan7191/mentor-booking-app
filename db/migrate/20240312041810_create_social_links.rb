class CreateSocialLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :social_links do |t|
      t.references :user, null: false, foreign_key: true
      t.string :icon
      t.string :link

      t.timestamps
    end
  end
end
