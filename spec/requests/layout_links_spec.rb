# encoding: UTF-8
require 'spec_helper'

describe "LayoutLinks" do

  #Permet de tester que la route par default se dirige bien vers la page d'accueil
  it "devrait trouver une page Accueil a /" do
    get '/'
    response.should have_selector('title', :content => "Accueil")
  end #Fin de it

  #Permet de tester que la route contact se dirige bien vers la page contact
  it "devrait trouver une page Contact at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end #Fin de it

  #Permet de tester que la route about se dirige bien vers la page A propos
  it "should have an a propos page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "A Propos")
  end #Fin de it

  #Permet de tester que la route help se dirige bien vers la page d'aide
  it "devrait trouver une page aide a help" do
    get '/help'
    response.should have_selector('title', :content => "Aide")
  end #Fin de it

  #Permet de tester que la route signup se dirige bien vers la page d'inscription
  it "devrait avoir une page d'inscription a signup" do
    get '/signup'
    response.should have_selector('title', :content => "Inscription")
  end #Fin de it

  #Permet de tester que la route showUserList se dirige bien vers la liste des utilisateurs
  it "devrait avoir une page qui liste les users a showUserList" do
    get '/showUserList'
    response.should have_selector('title', :content => "Liste des utilisateurs")
  end #Fin de it

  #Permet de tester que la route showNonSportifList se dirige bien vers la liste des utilisateurs non sportifs
  it "devrait avoir une page qui liste les users non sportif a showNonSportifList" do
    get '/showNonSportifList'
    response.should have_selector('title', :content => "Liste des utilisateurs non sportifs")
  end #Fin de it

  #Permet de tester les liens sur les layout
  it "devrait avoir le bon lien sur le layout" do
    visit root_path
    click_link "Utilisateurs"
    response.should have_selector('title', :content => "Liste des utilisateurs")
    click_link "A Propos"
    response.should have_selector('title', :content => "A Propos")
    click_link "Aide"
    response.should have_selector('title', :content => "Aide")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    click_link "Accueil"
    response.should have_selector('title', :content => "Accueil")
    click_link "S'enregister"
    response.should have_selector('title', :content => "Inscription")
  end #Fin de it

end #Fin de describe