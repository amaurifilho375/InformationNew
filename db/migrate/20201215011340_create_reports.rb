class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :titulo
      t.integer :rating

      t.timestamps
    end
  end
end
