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
      #flash[:success] = "L'inscription de l'utilisateur est un succès."
      redirect_to @user
    else
      @titre = "Inscription"
      render 'new'
    end
  end	

end
