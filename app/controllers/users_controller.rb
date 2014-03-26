# encoding: UTF-8
class UsersController < ApplicationController
  require "prawn"

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  	@titre = "Inscription"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "L'inscription de l'utilisateur est un succès!"
      redirect_to @user
    else
      @titre = "Inscription"
      render 'new'
    end
  end	

  def showUserList
    @titre = "Liste des utilisateurs"
    @users = User.all
    generatePDF(@users)
  end

  def showNonSportifList
    
    @users = User.where(isSportif: false)
    @titre = "Liste des utilisateurs non sportifs"
    render 'showUserList'
  end

  def generatePDF(all_users)   
    Prawn::Document.generate("public/listUsers.pdf", :page_layout => :landscape) do |pdf|
      table_data = [["Nom", "Email", "Date de naissance", "Poids actuel", "Poids Idéal", "Taille", "IMC", "Sportif", "Souhaiterai en faire"]]

      all_users.each do |u|
      table_data += [["#{u.nom}", "#{u.email}", "#{u.ddn}", "#{u.poidsActu}", "#{u.poidsIdeal}", "#{u.taille}", "#{u.imc_without_desc}", "#{u.isSportif}" , "#{u.wantDoSport}"]]   
    end
    

    pdf.stroke_horizontal_rule
    pdf.formatted_text [{:text => "\nListe des utilisateurs\n\n",:styles => [:bold], :size => 20  }], :align => :center
    pdf.stroke_horizontal_rule
    pdf.text "\n \n \n"
    pdf.table(table_data,:width => 720, :row_colors => ["EFF8FB", "FFFFFF"])
    pdf.text "\n\n"

    pdf.text "Document créé le " + Time.now.to_s + "\n"   , :align => :center
    pdf.stroke_horizontal_rule
    end
  end
end
