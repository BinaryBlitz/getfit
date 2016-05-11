class API::TrainerPostsController < API::APIController
  before_action :set_trainer, only: [:index]

  def index
    @posts = @trainer.posts
    render 'api/posts/index'
  end

  private

  def set_trainer
    @trainer = Trainer.find(params[:trainer_id])
  end
end
