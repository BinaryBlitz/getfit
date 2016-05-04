class API::CommentsController < API::APIController
  before_action :set_post, only: [:index, :create]
  before_action :set_comment, only: [:destroy]

  def index
    @comments = @post.comments
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    if @comment.save
      render :show, status: :created
    else
      render json: @comment.errors, status: 422
    end
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
