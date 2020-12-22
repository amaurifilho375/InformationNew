class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :titulo
      t.integer :rating

      t.timestamps
    end
  end
end
