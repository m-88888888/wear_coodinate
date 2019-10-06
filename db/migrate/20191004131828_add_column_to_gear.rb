class AddColumnToGear < ActiveRecord::Migration[5.2]
  def up
    add_column :gears, :gear_image, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end

  def down
    remove_column :gears, :gear_image
  end
end
