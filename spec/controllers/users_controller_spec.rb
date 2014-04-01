# encoding: UTF-8
require 'spec_helper'

describe UsersController do
  render_views


  before(:each) do
    @base_title="Simple App du Tutoriel Ruby on Rails | "
  end #Fin de before

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
end #Fin describe UsersController