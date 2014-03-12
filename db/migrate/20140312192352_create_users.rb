# encoding: UTF-8
#Après avoir effectué différentes mises à jour sur la table 
#j'ai créé ce fichier pour que celle ci soit créée directement 
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :nom,        :limit => 50,  :null => false
      t.string  :email,      :limit => 50,  :null => false
      t.date    :ddn,  :null => false
      t.integer :poidsActu,  :null => false
      t.integer :poidsIdeal, :null => false
      t.boolean :isSportif,  :null => false
      t.boolean :wantDoSport,:null => false
      t.integer :taille,     :null => false
      t.attachment :cv
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end