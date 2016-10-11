class Trainer::StatisticsController < Trainer::TrainerController
  def index
    @statistics = TrainerStatistics.new(current_trainer, *date_params)
  end

  private

  def date_params
    [params[:from], params[:to]]
  end
end
