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

require 'spec_helper'

describe User do

  #Créé une instance d'un utilisateur utilisable dans le reste du fichier de test
  before(:each) do
    @attr = { :nom => "Alison Forget", :email => "alison.forget@gmail.com", :ddn => Date.today, :poidsActu => 53,
              :poidsIdeal => 50, :taille => 153, :isSportif => true, :wantDoSport => true}
  end #Fin de before

  #Test l'enregistrement d'un user avec des attributs corrects
  it "devrait creer une nouvelle instance dotee des attributs valides" do
    User.create!(@attr)
  end #Fin de it

  #Test un enregistrement afin de rejeter celui ci si le nom n'est pas renseigné
  it "exige un nom" do
    bad_guy = User.new(@attr.merge(:nom => ""))
    bad_guy.should_not be_valid
  end #Fin de it

  #Test un enregistrement afin de rejeter celui ci si l'email n'est pas renseigné
  it "exige une adresse email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end # Fin de it

  #Test un enregistrement afin de rejeter celui ci si la date de naissance n'est pas renseigné
  it "exige un ddn" do
    no_ddn_user = User.new(@attr.merge(:ddn => nil))
    no_ddn_user.should_not be_valid
  end #Fin de it

  #Test un enregistrement afin de rejeter celui ci si le poids actuel n'est pas renseigné
  it "devrait rejeter un poidsActu qui n'est pas un entier" do
    nan_poidsActu_user = User.new(@attr.merge(:poidsActu => "NaN"))
    nan_poidsActu_user.should_not be_valid
  end #Fin de it

  #Test un enregistrement afin de rejeter celui ci si le poids idéale n'est pas renseigné
  it "devrait rejeter un poidsIdeal qui n'est pas un entier" do
    nan_poidsIdeal_user = User.new(@attr.merge(:poidsIdeal => "NaN"))
    nan_poidsIdeal_user.should_not be_valid
  end #Fin de it

  #Test un enregistrement afin de rejeter celui ci si la taille n'est pas renseigné  
  it "devrait rejeter une taille qui n'est pas un entier" do
    nan_taille_user = User.new(@attr.merge(:taille => "NaN"))
    nan_taille_user.should_not be_valid
  end #Fin de it

  #Test un enregistrement afin de rejeter celui ci si le nom n'est pas renseigné
 it "devrait accepter une adresse email valide" do
    adresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    adresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end #Fin de boucle
  end #Fin de it

  #Test un enregistrement afin de rejeter celui ci si l'email n'est pas valide
  it "devrait rejeter une adresse email invalide" do
    adresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    adresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end #Fin de boucle
  end #Fin de it

  #Test l'enrigistrement d'un utilisateur avec un email qui est déja enregistré en base
  it "devrait rejeter un email double" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end #Fin de it

  #Idem que le test ci dessus mais en ignorant la casse
  it "devrait rejeter une adresse email invalide jusqu'a la casse" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end #Fin de it

  #Test un enregistrement afin de rejeter celui ci si le poids actuel est inférieur au poids idéal
  it "devrait rejeter le poidsActu si il est inférieur au poidsIdeal" do
    userWeight = User.new(@attr.merge(:poidsActu=> 55, :poidsIdeal => 70))
    userWeight.should_not be_valid
  end #Fin de it

end #Fin de describe User
