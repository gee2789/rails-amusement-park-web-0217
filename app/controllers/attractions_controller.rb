class AttractionsController < ApplicationController
  before_action :set_attractions, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:show, :edit, :update, :destory]

  def index
    @attractions = Attraction.all
    find_user
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params['id'])
  end


  def update
    @attraction = set_attractions
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end


  private

  def set_attractions
    @attraction = Attraction.find(params[:id])
  end

  def find_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      flash[:error] = "Login bruh"
      redirect_to root_path
    end
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
