class DeleteUrlColumnsFromGears < ActiveRecord::Migration[5.2]
  def change
    remove_column :gears, :url
  end
end
