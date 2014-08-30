class Members::BaseController < ApplicationController
  before_action :authenticate_member!

  def login_redirect
    if last_post.nil? or last_post.updated_at.to_date < Time.now.to_date
      redirect_to new_post_path
    else
      redirect_to posts_path
    end
  end

  protected
    def authenticate_member!
      unless member_signed_in?
        flash[:notice] = "請始用Facebook登入!"
        redirect_to root_path
      end
    end

    def last_post
      current_member.posts.last
    end
end
