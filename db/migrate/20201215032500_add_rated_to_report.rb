class AddRatedToReport < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :rated, :integer
  end
end
