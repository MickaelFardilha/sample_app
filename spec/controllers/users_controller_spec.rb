# encoding: UTF-8
require 'spec_helper'

describe UsersController do
  render_views


  before(:each) do
    @base_title="Simple App du Tutoriel Ruby on Rails | "
  end

  # Permet de vérifier l'exactitudes des données du formulaire
  describe "GET 'new'" do
    
    # Test la methode new du controller
    it "devrait reusir" do
      get 'new'
      response.should be_success
    end

    # Test  l'exactitude du titre de la page d'inscription
    it "devrait avoir le titre adequat" do
      get 'new'
      response.should have_selector("title", :content =>  @base_title + "Inscription")
    end

    # Test si le champ nom de la page d'inscription a été renseigné 
    it "devrait avoir un champ nom" do
      get 'new'
      response.should have_selector("input[name='user[nom]'][type='text']")
    end

    # Test si le champ email de la page d'inscription a été renseigné 
    it "devrait avoir un champ email" do
      get 'new'
      response.should have_selector("input[name='user[email]'][type='text']")
    end

    # Test si l'année du champ date de naissance de la page d'inscription a été renseigné 
    it "devrait avoir un champ année ddn" do
      get 'new'
      response.should have_selector("select[name='user[ddn(1i)]']")
    end

    # Test si le mois du champ date de naissance de la page d'inscription a été renseigné 
    it "devrait avoir un champ mois ddn" do
      get 'new'
      response.should have_selector("select[name='user[ddn(2i)]']")
    end

    # Test si le jour du champ date de naissance de la page d'inscription a été renseigné 
    it "devrait avoir un champ jour ddn" do
      get 'new'
      response.should have_selector("select[name='user[ddn(3i)]']")
    end

    # Test si le champ poids actuel de la page d'inscription a été renseigné 
    it "devrait avoir un champ poidsActu" do
      get 'new'
      response.should have_selector("input[name='user[poidsActu]'][type='text']")
    end


    # Test si le champ poids idéal de la page d'inscription a été renseigné 
    it "devrait avoir un champ poidsIdeal" do
      get 'new'
      response.should have_selector("input[name='user[poidsIdeal]'][type='text']")
    end

    # Test si le champ taille de la page d'inscription a été renseigné     
    it "devrait avoir un champ taille" do
      get 'new'
      response.should have_selector("input[name='user[taille]'][type='text']")
    end

    it "devrait avoir un champ isSportif" do
      get 'new'
      response.should have_selector("input[name='user[isSportif]'][type='radio']")
    end

    it "devrait avoir un champ wantDoSport" do
      get 'new'
      response.should have_selector("input[name='user[wantDoSport]'][type='radio']")
    end

     it "devrait avoir un champ cv" do
      get 'new'
      response.should have_selector("input[name='user[cv]'][type='file']")
    end

  end
end