class OnlineUsersController < ApplicationController
  def index
    @online_users = OnlineUser.all
    respond_to do |format|
      format.js
    end
  end
end
