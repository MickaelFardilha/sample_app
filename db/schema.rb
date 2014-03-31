# encoding: UTF-8
# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  nom             :string(50)       not null
#  email           :string(50)       not null
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
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


ActiveRecord::Schema.define(:version => 20140312192352) do

  create_table "users", :force => true do |t|
    t.string   "nom",             :limit => 50, :null => false
    t.string   "email",           :limit => 50, :null => false
    t.date     "ddn",                           :null => false
    t.integer  "poidsActu",                     :null => false
    t.integer  "poidsIdeal",                    :null => false
    t.boolean  "isSportif",                     :null => false
    t.boolean  "wantDoSport",                   :null => false
    t.integer  "taille",                        :null => false
    t.string   "cv_file_name"
    t.string   "cv_content_type"
    t.integer  "cv_file_size"
    t.datetime "cv_updated_at"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end #Fin de boucle
end #Fin du schema
