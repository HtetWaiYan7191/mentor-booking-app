class SetUserDefaultViewCountToZero < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :view_count, :integer, default: 0
  end
end
