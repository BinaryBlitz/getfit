class API::SpecializationsController < API::APIController
  def index
    @specializations = Specialization.all
  end
end
