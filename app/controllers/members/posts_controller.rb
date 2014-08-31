class Members::PostsController < Members::BaseController

  def show
    @post = Post.find(params[:id])
  end

  def new
    if current_member.posts.empty?  or current_member.posts.last.created_at < Time.now.to_date
      @post = Post.new
    else
      redirect_to edit_post_path
    end
  end

  def create
    @post = Post.new post_params
    @post.member = current_member
    @post.pu_result = Post.pu_gua.join ','

    unless @post.save!
      flash[:alert] = "存檔失敗！"
    end

    redirect_to post_path(@post)
  end

  private

    def post_params
      params.require(:post).permit(:content, :pu_result)
    end
end
