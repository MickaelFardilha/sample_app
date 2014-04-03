# encoding: UTF-8
require 'spec_helper'

describe PagesController do
  render_views

  #Création de la variable contenant la base du titre
  before(:each) do
    @base_title="Simple App du Tutoriel Ruby on Rails | "
  end #Fin de boucle

  #Test de la page home
  describe "GET 'home'" do
    #Test si la page home est accessible
    it "should be successful" do
      get 'home'
      response.should be_success
    end #Fin de it
    #Test si la page home à le bon titre
    it "doit avoir le bon titre" do
      get 'home'
      response.should have_selector("title", :content => @base_title + "Accueil")
    end #Fin de it
  end #Fin describe

  describe "GET 'contact'" do
    #Test si la page contact est accessible
    it "should be successful" do
      get 'contact'
      response.should be_success
    end #Fin de it
    #Test si la page contact à le bon titre
    it "devrait avoir le bon titre" do
      get 'contact'
      response.should have_selector("title", :content => @base_title + "Contact")
    end #Fin de it
  end #Fin describe

  describe "GET 'about'" do
    #Test si la page about est accessible
    it "should be successful" do
      get 'about'
      response.should be_success
    end #Fin de it
    #Test si la page about à le bon titre
    it "devrait avoir le bon titre" do
      get 'about'
      response.should have_selector("title", :content => @base_title + "A Propos")
    end #Fin de it
  end #Fin describe

  describe "GET 'help'" do
    #Test si la page help est accessible
    it "should be successful" do
      get 'help'
      response.should be_success
    end #Fin de it
    #Test si la page help à le bon titre
    it "devrait avoir le bon titre" do
      get 'help'
      response.should have_selector("title", :content => @base_title + "Aide")
    end #Fin de it
  end #Fin describe

end #Fin describe PagesController