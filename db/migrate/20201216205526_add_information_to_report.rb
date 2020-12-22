class AddInformationToReport < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :information, :text
  end
end
