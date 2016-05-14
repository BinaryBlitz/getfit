class API::UserProgramsController < API::APIController
  def index
    @programs = current_user.programs.visible
    render 'api/programs/index'
  end
end
