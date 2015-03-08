class SessionsController < ApplicationController
  def create
    if params[:username].blank? || params[:dialect].blank?
      redirect_to root_path
      flash[:danger] = "Please check your inputs"
    else
      session[:username] = params[:username]
      session[:dialect] = params[:dialect]
      OnlineUser.create(username: session[:username])
      redirect_to home_path
      flash[:success] = "Signed in."
    end
  end

  def destroy
    online_user = OnlineUser.find_by(username: "#{session[:username]}")
    online_user.destroy
    session[:username] = nil
    session[:dialect] = nil
    redirect_to root_path
    flash[:info] = "Signed out."
  end
end
