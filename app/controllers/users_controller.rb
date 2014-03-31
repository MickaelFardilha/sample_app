# encoding: UTF-8
class UsersController < ApplicationController
  require "prawn"

  #Permet d'afficher un user
  def show
    @user = User.find(params[:id])
  end #Fin de def show


  #Permet d'afficher la page d'un nouvel user
  def new
  	@user = User.new
  	@titre = "Inscription"
  end #Fin de def new

  
  #Création d'un user
  def create
    @user = User.new(params[:user])
    if @user.isSportif
      @user.wantDoSport=false
    end #Fin de if
    if @user.save
      redirect_to @user
    else
      @titre = "Inscription"
      render 'new'
    end #Fin de if
  end	#Fin de def create


  #Permet d'afficher la liste des users
  def showUserList
    @titre = "Liste des utilisateurs"
    @users = User.all
    generatePDF(@users)
  end #Fin de def showUserList


  #Permet d'afficher la liste des users non sportif voulant faire du sport
  def showNonSportifList
    @users = User.where(isSportif: false, wantDoSport: true)
    @titre = "Liste des utilisateurs non sportifs"
    generatePDFnonSportif(@users)
    render 'showUserList'
  end #Fin de def showNonSportifList



  #Genere un PDF de la liste des users 
  def generatePDF(all_users)   
    Prawn::Document.generate("public/listUsers.pdf", :page_layout => :landscape) do |pdf|
      
      table_data = [["Nom", "Email", "Date de naissance", "Poids actuel", "Poids Idéal", "Taille", "IMC", "Sportif", "Souhaite faire du sport"  ]]
      
      all_users.each do |u|
        table_data += [["#{u.nom}", "#{u.email}", "#{u.ddn}", "#{u.poidsActu}", "#{u.poidsIdeal}", "#{u.taille}", "#{u.imc_without_desc}", "#{u.isSportif}" , "#{u.wantDoSport}"]]   
      end #Fin de boucle 
    
      pdf.stroke_horizontal_rule
      pdf.formatted_text [{:text => "\nListe des utilisateurs\n\n",:styles => [:bold], :size => 20  }], :align => :center
      pdf.stroke_horizontal_rule
      pdf.text "\n \n \n"
      pdf.table(table_data,:width => 720, :row_colors => ["A9D0F5", "FFFFFF"])
      pdf.text "\n\n"

      pdf.text "Document créé le " + Time.now.to_s + "\n"   , :align => :center
      pdf.stroke_horizontal_rule
    end #Fin d'écriture document PDF
  end #Fin de def generatePDFsportif



  #Genere un PDF de la liste des users non sportif voulant faire du sport
  def generatePDFnonSportif(all_users)   
    Prawn::Document.generate("public/listUsers.pdf", :page_layout => :landscape) do |pdf|
      
      table_data = [["Nom", "Email", "Date de naissance", "Poids actuel", "Poids Idéal", "Taille", "IMC"]]
      
      all_users.each do |u|
        table_data += [["#{u.nom}", "#{u.email}", "#{u.ddn}", "#{u.poidsActu}", "#{u.poidsIdeal}", "#{u.taille}", "#{u.imc_without_desc}"]]   
      end #Fin de boucle 

      pdf.stroke_horizontal_rule
      pdf.formatted_text [{:text => "\nListe des utilisateurs non sportif\n\n",:styles => [:bold], :size => 20  }], :align => :center
      pdf.stroke_horizontal_rule
      pdf.text "\n \n \n"
      pdf.table(table_data,:width => 720, :row_colors => ["A9D0F5", "FFFFFF"])
      pdf.text "\n\n"

      pdf.text "Document créé le " + Time.now.to_s + "\n"   , :align => :center
      pdf.stroke_horizontal_rule
    end #Fin d'écriture document PDF
  end #Fin de def generatePDFnonSportif


end #Fin de classe
