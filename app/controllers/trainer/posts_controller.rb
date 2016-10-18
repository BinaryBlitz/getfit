class Trainer::PostsController < Trainer::TrainerController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = current_trainer.posts
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_trainer.posts.build(post_params)

    if @post.save
      redirect_to [:trainer, @post], notice: 'Запись успешно создана'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to [:trainer, @post], notice: 'Запись успешно обновлена'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to trainer_posts_url, notice: 'Запись успешно удалена'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.fetch(:post, {}).permit(:content, :image, :image_cache, :program_id)
  end
end
