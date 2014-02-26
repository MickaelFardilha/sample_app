class ChangeBooleanFormatInUsers < ActiveRecord::Migration
  def up
  	  	change_column :users, :isSportif, :boolean
  end

  def down
  	rails ActiveRecord::IrreversibleMigration
  end
end
