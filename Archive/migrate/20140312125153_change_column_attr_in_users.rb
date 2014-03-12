class ChangeColumnAttrInUsers < ActiveRecord::Migration
  def up
  	change_column :users, :nom, :string ,:limit => 50,  :null => false
  	change_column :users, :ddn, :date , :null => false
  	change_column :users, :poidsActu, :integer, :null => false
  	change_column :users, :poidsIdeal, :integer,:null => false
  	change_column :users, :isSportif, :boolean, :null => false
  	change_column :users, :wantDoSport, :boolean, :null => false
  	change_column :users, :taille, :integer,:null => false
  end

  def down
  end
end

#  id              :integer          not null
#  nom             :string(255)      not null
#  email           :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  ddn             :date             not null
#  poidsActu       :integer          not null
#  poidsIdeal      :integer          not null
#  isSportif       :boolean          not null
#  wantDoSport     :boolean          not null
#  taille          :integer          not null
#  cv_file_name    :string(255)
#  cv_content_type :string(255)
#  cv_file_size    :integer
#  cv_updated_at   :datetime