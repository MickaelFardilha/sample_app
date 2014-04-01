class PagesController < ApplicationController

  #Permet de définir la partie variable du titre pour la page home
  def home
  	@titre="Accueil"
  end #Fin de def home

  #Permet de définir la partie variable du titre pour la page contact
  def contact
  	@titre="Contact"
  end #Fin de def contact

  #Permet de définir la partie variable du titre pour la page about
  def about
  	@titre="A Propos"
  end #Fin de def about

  #Permet de définir la partie variable du titre pour la page help
  def help
  	@titre="Aide"
  end #Fin de def help
end #Fin de classe
