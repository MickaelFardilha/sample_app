class PagesController < ApplicationController
  def home
  	@titre="Accueil"
  end #Fin de def home

  def contact
  	@titre="Contact"
  end #Fin de def contact

  def about
  	@titre="A Propos"
  end #Fin de def about

  def help
  	@titre="Aide"
  end #Fin de def help
end #Fin de classe
