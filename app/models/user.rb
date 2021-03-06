# encoding: UTF-8
# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  nom             :string(50)       not null
#  email           :string(50)       not null
#  ddn             :date             not null
#  poidsActu       :integer          not null
#  poidsIdeal      :integer          not null
#  isSportif       :boolean          not null
#  wantDoSport     :boolean          not null
#  taille          :integer          not null
#  cv_file_name    :string(255)
#  cv_content_type :string(255)
#  cv_file_size    :integer
#  cv_updated_at   :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  has_attached_file :cv

  attr_accessible :email, :nom, :ddn, :poidsActu, :poidsIdeal, :isSportif, :wantDoSport, :taille, :cv

  #Regex permettant de valider un email 
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #Rend obligatoire la présente des champs nom, email, ddn, poidsActu, poidsIdeal, et taille
  #Maximise les tailles des champs email et nom et contraint l'email à une regex
  validates :nom, :presence => true, :length=>{:maximum => 50}
  validates :email, :presence => true,  :format=>{:with => email_regex}, :uniqueness => { :case_sensitive => false }, :length=>{:maximum => 50}
  validates :ddn, :presence => true
  validates :poidsActu, :presence => true
  validates :poidsIdeal, :presence => true
  validates :taille, :presence => true

  #Oblige le poids actu à être supérieur au poids idéal
  validates_numericality_of :poidsActu, :greater_than => :poidsIdeal
  #Oblige le poids actu, le poids idéal et la taille a etre un entier
  validates_numericality_of :poidsActu, :only_integer => true 
  validates_numericality_of :poidsIdeal, :only_integer => true 
  validates_numericality_of :taille, :only_integer => true 

  	#Permet de calculer l'age
  	def age
 		if self.ddn <= Date.today			
	      now = Time.now.utc.to_date

	      if(now.month > self.ddn.month || (now.month == self.ddn.month && now.day >= self.ddn.day)) 
	      	age = now.year - self.ddn.year
	      else
	        age = now.year - self.ddn.year - 1
	      end #Fin de si
	      age = age.to_s+ " ans"
	    else	
	    	age = "Age incorrect"
	  	end #Fin de si
	end #Fin de def age

	#Permet de donner un imc avec une description
	def imc
  		sizeMeter = (self.taille.to_f/100)
	  	imc = (self.poidsActu / (sizeMeter*sizeMeter)).round(2)	
	  	 	imcDesc = case imc
				when 0...16 then "Maigreur extrême"
				when 16...18 then "Maigreur"
				when 18...25 then "Poids normal"
				when 25...30 then "Surpoids"
				when 30...35 then "Obésité modérée"
				when 35...40 then "Obésité morbide"
				else "Obésité massive"	
			end #Fin de case
		imc=imcDesc + ", avec un imc de " + imc.to_s
	end #Fin de def imc 

	#permet de donner un imc sans description
	def imc_without_desc
  		sizeMeter = (self.taille.to_f/100)
	  	imc_without_desc = (self.poidsActu / (sizeMeter*sizeMeter)).round(2)
	end #Fin de def imc_without_desc

end #Fin de classe
