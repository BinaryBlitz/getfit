class Trainer::StatisticsController < Trainer::TrainerController
  def index
    @statistics = TrainerStatistics.new(current_trainer, date_range)
  end

  private

  def date_range
    from = params[:from]
    to = params[:to]
    { from: from, to: to }
  end
end
