class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = find_user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "nah bro"
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end


private

def find_user
  User.find_by(name: params["user"]["name"])
end

end
