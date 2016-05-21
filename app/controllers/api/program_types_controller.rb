class API::ProgramTypesController < API::APIController
  def index
    @program_types = ProgramType.all
  end
end
