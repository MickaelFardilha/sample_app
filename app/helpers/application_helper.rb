module ApplicationHelper
	# Retourne un titre basé sur la page.
	def titre
		base_titre = "Simple App du Tutoriel Ruby on Rails"
		if @titre.nil?
		  base_titre
		else
		  "#{base_titre} | #{@titre}"
		end #Fin de if
	end #Fin de def titre

	# Retourne un le logo de la page
	def logo
		logo = image_tag("logo.png", :alt => "Application exemple", :class => "round")
	end #Fin de def logo
end #Fin de classe
