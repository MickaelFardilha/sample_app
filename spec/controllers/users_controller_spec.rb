# encoding: UTF-8
require 'spec_helper'

describe UsersController do
  render_views


  #Création de la variable contenant la base du titre
  before(:each) do
    @base_title="Simple App du Tutoriel Ruby on Rails | "
  end #Fin de before

  #Création de trois users pour tester la liste des users
  before(:each) do
    user_toto  = User.create!({ :nom => "Toto", :email => "Toto@gmail.com", :ddn => Date.new(1998,3,4), :poidsActu => 89,
            :poidsIdeal => 82, :taille => 179, :isSportif => false, :wantDoSport => true, :cv => nil})
    user_titi = User.create!({ :nom => "Titi", :email => "Titi@gmail.com", :ddn => Date.new(1974,4,5), :poidsActu => 112,
            :poidsIdeal => 105, :taille => 196, :isSportif => false, :wantDoSport => true, :cv => nil})
    user_tutu  = User.create!({ :nom => "Tutu", :email => "Tutu@gmail.com", :ddn => Date.new(1978,5,6), :poidsActu => 69,
            :poidsIdeal => 59, :taille => 176, :isSportif => true, :wantDoSport => false, :cv => nil})
  
    #Création du tableau contenant trois users pour tester la liste des users
    @users = [user_toto, user_titi, user_tutu]
    @usersNotSportif = [user_toto, user_titi]
  end

  #Permet de vérifier les éléments présent sur la page d'inscription
  describe "GET 'new'" do   
    #Test si la page new est accessible
    it "devrait reusir" do
      get 'new'
      response.should be_success
    end #Fin de it

    #Test l'exactitude du titre de la page d'inscription
    it "devrait avoir le titre adequat" do
      get 'new'
      response.should have_selector("title", :content =>  @base_title + "Inscription")
    end #Fin de it

    #Test la présence du champ saisissable nom de la page d'inscription
    it "devrait avoir un champ nom" do
      get 'new'
      response.should have_selector("input[name='user[nom]'][type='text']")
    end #Fin de it

    #Test la présence du champ saisissable email de la page d'inscription
    it "devrait avoir un champ email" do
      get 'new'
      response.should have_selector("input[name='user[email]'][type='text']")
    end #Fin de it

    #Test la présence du champ saisissable année ddn de la page d'inscription
    it "devrait avoir un champ année ddn" do
      get 'new'
      response.should have_selector("select[name='user[ddn(1i)]']")
    end #Fin de it

    #Test la présence du champ saisissable mois ddn de la page d'inscription
    it "devrait avoir un champ mois ddn" do
      get 'new'
      response.should have_selector("select[name='user[ddn(2i)]']")
    end #Fin de it

    #Test la présence du champ saisissable jour ddn de la page d'inscription 
    it "devrait avoir un champ jour ddn" do
      get 'new'
      response.should have_selector("select[name='user[ddn(3i)]']")
    end #Fin de it

    #Test la présence du champ saisissable poidsActu de la page d'inscription
    it "devrait avoir un champ poidsActu" do
      get 'new'
      response.should have_selector("input[name='user[poidsActu]'][type='text']")
    end #Fin de it


    #Test la présence du champ saisissable poidsIdeal de la page d'inscription
    it "devrait avoir un champ poidsIdeal" do
      get 'new'
      response.should have_selector("input[name='user[poidsIdeal]'][type='text']")
    end #Fin de it

    #Test la présence du champ saisissable taille de la page d'inscription   
    it "devrait avoir un champ taille" do
      get 'new'
      response.should have_selector("input[name='user[taille]'][type='text']")
    end #Fin de it

    #Test la présence du bouton radio isSportif de la page d'inscription 
    it "devrait avoir un champ isSportif" do
      get 'new'
      response.should have_selector("input[name='user[isSportif]'][type='radio']")
    end #Fin de it

    #Test la présence du bouton radio wantDoSport de la page d'inscription 
    it "devrait avoir un champ wantDoSport" do
      get 'new'
      response.should have_selector("input[name='user[wantDoSport]'][type='radio']")
    end #Fin de it

    #Test la présence du champ cv de la page d'inscription
     it "devrait avoir un champ cv" do
      get 'new'
      response.should have_selector("input[name='user[cv]'][type='file']")
    end #Fin de it
  end #Fin de describe



  #Permet de vérifier les éléments présent sur la page qui liste les utilisateurs
  describe "GET 'showUserList'" do      
    #Test si la page showUserList est accessible
    it "devrait reusir" do
      get 'showUserList'
      response.should be_success
    end #Fin de it

    #Test l'exactitude du titre de la page d'inscription
    it "devrait avoir le titre adequat" do
      get 'showUserList'
      response.should have_selector("title", :content =>  @base_title + "Liste des utilisateurs")
    end #Fin de it

    #Test si les entêtes du tableau sont présente 
    it "devrait reusir" do
      get 'showUserList'
        response.should have_selector("th", :content => "Nom")
        response.should have_selector("th", :content => "Email")
        response.should have_selector("th", :content => "Date de Naissance")
        response.should have_selector("th", :content => "Age")
        response.should have_selector("th", :content => "Poids actuel")
        response.should have_selector("th", :content => "Poids idéal")
        response.should have_selector("th", :content => "Taille")
        response.should have_selector("th", :content => "IMC")
        response.should have_selector("th", :content => "Sportif")
        response.should have_selector("th", :content => "CV")
    end #Fin de it

    it "devrait avoir un élément pour chaque users" do
      get 'showUserList'
      @users.each do |u|
        response.should have_selector("td", :content => u.nom)
        response.should have_selector("td", :content => u.email)
        response.should have_selector("td", :content => u.ddn.to_s)
        response.should have_selector("td", :content => u.poidsActu.to_s)
        response.should have_selector("td", :content => u.poidsIdeal.to_s)
        response.should have_selector("td", :content => u.taille.to_s)
        response.should have_selector("td", :content => u.isSportif ? "oui" : "non")
        response.should have_selector("td", :content => u.wantDoSport ? "oui" : "non")
      end
    end
  end #Fin de describe


  #Permet de vérifier les éléments présent sur la page qui liste les utilisateurs non sportif
  describe "GET 'showNonSportifList'" do   
     #Test si la page showUserList est accessible
    it "devrait reusir" do
      get 'showNonSportifList'
      response.should be_success
    end #Fin de it

    #Test l'exactitude du titre de la page d'inscription
    it "devrait avoir le titre adequat" do
      get 'showNonSportifList'
      response.should have_selector("title", :content =>  @base_title + "Liste des utilisateurs non sportifs")
    end #Fin de it

    #Test si les entêtes du tableau sont présentes, sauf isSportif et wantDoSport
    it "devrait reusir" do
      get 'showNonSportifList'
        response.should have_selector("th", :content => "Nom")
        response.should have_selector("th", :content => "Email")
        response.should have_selector("th", :content => "Date de Naissance")
        response.should have_selector("th", :content => "Age")
        response.should have_selector("th", :content => "Poids actuel")
        response.should have_selector("th", :content => "Poids idéal")
        response.should have_selector("th", :content => "Taille")
        response.should have_selector("th", :content => "IMC")
        response.should_not have_selector("th", :content => "Sportif")
        response.should_not have_selector("th", :content => "Souhaiterai <br> devenir sportif")
        response.should have_selector("th", :content => "CV")
    end #Fin de it

    it "devrait avoir un élément pour chaque users non sportif, en rejetant isSportif et wantDoSport" do
      get 'showNonSportifList'
      @usersNotSportif.each do |u|
        response.should have_selector("td", :content => u.nom)
        response.should have_selector("td", :content => u.email)
        response.should have_selector("td", :content => u.ddn.to_s)
        response.should have_selector("td", :content => u.poidsActu.to_s)
        response.should have_selector("td", :content => u.poidsIdeal.to_s)
        response.should have_selector("td", :content => u.taille.to_s)
        response.should_not have_selector("td", :content => u.isSportif ? "oui" : "non")
        response.should_not have_selector("td", :content => u.wantDoSport ? "oui" : "non")
      end
    end
  end #Fin de describe

end #Fin describe UsersController 