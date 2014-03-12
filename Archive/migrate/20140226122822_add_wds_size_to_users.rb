class AddWdsSizeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :wantDoSport, :boolean
    add_column :users, :taille, :integer
  end

  def down
  	remove_column :users, :wantDoSport
  	remove_column :users, :taille
  end
end
