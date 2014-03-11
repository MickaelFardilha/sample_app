Factory.define :user do |user|

  user.nom                    "Alison FORGET"
  user.email                  "AlisonForget.gmail.com"
  user.dateNaissance     		  Date.new(2001,2,3)   
  user.poidsActuel					  53
  user.poidsIdeal						  50
  user.taille                 153
  user.estSportif						  true
  user.souhaitePratiquerSport false


end