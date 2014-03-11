# encoding: UTF-8
# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nom        :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ddn        :date 
#  poidsActu  :integer
#  poidsIdeal :integer 
#  isSportif  :boolean
#  wantDoSport:boolean
#  taille     :integer 
#  cv         :t.attachment 

require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :nom => "Alison Forget", :email => "alison.forget@gmail.com", :ddn => Date.today, :poidsActu => 60,
              :poidsIdeal => 55, :taille => 170, :isSportif => true, :wantDoSport => true}
  end

  it "devrait creer une nouvelle instance dotee des attributs valides" do
    User.create!(@attr)
  end

  it "exige un nom" do
    bad_guy = User.new(@attr.merge(:nom => ""))
    bad_guy.should_not be_valid
  end

  it "exige une adresse email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "exige un ddn" do
    no_ddn_user = User.new(@attr.merge(:ddn => nil?))
    no_ddn_user.should_not be_valid
  end

  
  it "exige un poidsActu" do
    no_poidsActu_user = User.new(@attr.merge(:poidsActu => nil?))
    no_poidsActu_user.should_not be_valid
  end


  it "exige un poidsIdeal" do
    no_poidsIdeal_user = User.new(@attr.merge(:poidsIdeal => nil?))
    no_poidsIdeal_user.should_not be_valid
  end

  it "exige une taille" do
    no_taille_user = User.new(@attr.merge(:taille => nil?))
    no_taille_user.should_not be_valid
  end

  it "devrait rejeter un poidsActu qui n'est pas un entier" do
    nan_poidsActu_user = User.new(@attr.merge(:poidsActu => "NaN"))
    nan_poidsActu_user.should_not be_valid
  end

  it "devrait rejeter un poidsIdeal qui n'est pas un entier" do
    nan_poidsIdeal_user = User.new(@attr.merge(:poidsIdeal => "NaN"))
    nan_poidsIdeal_user.should_not be_valid
  end

  it "devrait rejeter un poidsIdeal qui n'est pas un entier" do
    nan_taille_user = User.new(@attr.merge(:taille => "NaN"))
    nan_taille_user.should_not be_valid
  end

 it "devrait accepter une adresse email valide" do
    adresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    adresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "devrait rejeter une adresse email invalide" do
    adresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    adresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "devrait rejeter un email double" do
    # Place un utilisateur avec un email donné dans la BD.
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "devrait rejeter une adresse email invalide jusqu'a la casse" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end


  it "devrait rejeter le poidsActu si il est supérieur au poidsIdeal" do
    userWeight = User.new(@attr.merge(:poidsActu=> 55, :poidsIdeal => 70))
    userWeight.should_not be_valid
  end

 

end