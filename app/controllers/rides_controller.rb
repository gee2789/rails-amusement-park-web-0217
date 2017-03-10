class RidesController<ApplicationController

  def update
    set_attractions
    find_user
    @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
    flash[:notice] = @ride.take_ride
    redirect_to user_path(@user)
  end




private

def find_user
  if params["user"]["user"]
    @user = User.find(params["user"]["user"])
  else
    flash[:error] = "Login bruh"
    redirect_to root_path
  end
end

def set_attractions
  @attraction = Attraction.find(params["user"]['attraction'])
end


end
