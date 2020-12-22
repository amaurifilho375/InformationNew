class AddRatingToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :rating, :string
  end
end
