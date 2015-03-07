class SessionsController < ApplicationController
  def create
    if params[:username].blank? || params[:dialect].blank?
      redirect_to root_path
      flash[:danger] = "Please check your inputs"
    else
      session[:username] = params[:username]
      session[:dialect] = params[:dialect]
      redirect_to home_path
      flash[:success] = "Signed in."
    end
  end

  def destroy
    session[:username] = nil
    session[:dialect] = nil
    redirect_to root_path
    flash[:info] = "Signed out."
  end
end
