class AddRatedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rated, :integer
  end
end
