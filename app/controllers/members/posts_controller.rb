class Members::PostsController < Members::BaseController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = current_member.posts.latest.limit(10).page params[:page]
  end

  def new
    if current_member.posts.empty?  or current_member.posts.last.created_at < Time.now.to_date
      @post = Post.new
    else
      flash[:notice] = "今天卜過了喔，沈澱一下，明天在卜看看 = )"
      redirect_to edit_post_path id: current_member.posts.last.id
    end
  end

  def create
    @post = Post.new post_params
    @post.member = current_member
    @post.bu_result = Post.bu_gua.join ','

    if @post.save!
      flash[:success] = "存檔成功！"
    else
      flash[:alert] = "存檔失敗！"
    end

    redirect_to post_path(@post)
  end

  def show
    @yijing_result = @post.yijing
  end

  def edit
  end

  def update
    if @post.update! post_params
      flash[:success] = "存檔成功！"
    else
      flash[:alert] = "存檔失敗！"
    end

    redirect_to post_path(@post)

  end

  private
    def set_post
      @post = Post.find params[:id]
    end

    def post_params
      params.require(:post).permit(:public_content, :private_content, :bu_result)
    end
end
