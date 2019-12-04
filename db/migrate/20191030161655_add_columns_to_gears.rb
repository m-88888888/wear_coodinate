class AddColumnsToGears < ActiveRecord::Migration[5.2]
  def change
    add_column :gears, :name, :string
    add_column :gears, :kind, :string
    add_column :gears, :brand, :string
    add_column :gears, :model_year, :integer
  end
end
