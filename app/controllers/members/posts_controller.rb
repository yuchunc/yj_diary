class Members::PostsController < Members::BaseController
  def new
    @post = Post.new
  end
end
