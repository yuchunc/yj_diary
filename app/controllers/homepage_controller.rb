class HomepageController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    if member_signed_in?
      redirect_to login_redirect_path
    end
  end
end
