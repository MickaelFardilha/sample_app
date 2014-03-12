class AddAttributToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ddn, :date
    add_column :users, :poidsActu, :integer
    add_column :users, :poidsIdeal, :integer
    add_column :users, :isSportif, :date
  end

  def down
  	remove_column :users, :ddn
  	remove_column :users, :poidsActu
  	remove_column :users, :poidsIdeal
  	remove_column :users, :isSportif
  end
end
