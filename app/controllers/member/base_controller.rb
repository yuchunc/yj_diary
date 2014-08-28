class Member::BaseController < ApplicationController
  before_action :authenticate_member!

  protected
    def authenticate_member!
      unless member_signed_in?
        flash[:notice] = "請用Facebook登入!"
        redirect_to root_path
      end
    end
end
