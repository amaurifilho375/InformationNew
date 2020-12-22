class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :lingua
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
