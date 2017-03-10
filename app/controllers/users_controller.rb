class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def index
  end

  def show
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    # binding.pry
    redirect_to user_path(@user)
  end


  def update

  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def find_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      flash[:error] = "Login bruh"
      redirect_to root_path
    end
  end
end
