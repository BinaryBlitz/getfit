class API::PurchasesController < API::APIController
  before_action :set_program, only: [:create]

  def create
    @purchase = current_user.purchases.build(program: @program)

    if @purchase.save
      render :show, status: :created
    else
      render json: @purchase.errors, status: 422
    end
  end

  private

  def set_program
    @program = Program.find(params[:program_id])
  end
end
