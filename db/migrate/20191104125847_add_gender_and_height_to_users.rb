class AddGenderAndHeightToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :integer
    add_column :users, :height, :integer 
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
