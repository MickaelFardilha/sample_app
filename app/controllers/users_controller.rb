# encoding: UTF-8
class UsersController < ApplicationController

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
    #@user_statistics = UserStatistics.new(@users)

    respond_to do |format|
      format.html
      format.pdf
    end
  end

  def showNonSportifList
    @titre = "Liste des utilisateurs non sportifs"
    @users = User.where(isSportif: false)
    #@user_statistics = UserStatistics.new(@users)

    respond_to do |format|
      format.html
      format.pdf
    end
  end

end
