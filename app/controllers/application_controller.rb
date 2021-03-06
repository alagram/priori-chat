class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user = session[:username] if session[:username]
  end

  def require_user
    redirect_to root_path unless current_user
  end

  def emojify(content)
    context = {gfm: true, asset_root: "/images"}
    pipeline = HTML::Pipeline.new([
      HTML::Pipeline::EmojiFilter
      ], context)
    pipeline.call(content)[:output]
  end

  helper_method :current_user
end
