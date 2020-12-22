class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.string :lingua
      t.integer :status
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
