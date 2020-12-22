class RemoveRatedFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :rated, :integer
  end
end
