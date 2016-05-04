class API::PostsController < API::APIController
  skip_before_action :restrict_access, only: [:popular]

  def index
    @posts = Post.all
  end

  def popular
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find(params[:id])
  end
end
