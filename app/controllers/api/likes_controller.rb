class API::LikesController < API::APIController
  before_action :set_post, only: [:create]
  before_action :set_like, only: [:destroy]

  def create
    @like = @post.likes.build(user: current_user)

    if @like.save
      render :show, status: :created
    else
      render json: @like.errors, status: 422
    end
  end

  def destroy
    @like.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_like
    @like = Like.find(params[:id])
  end
end
