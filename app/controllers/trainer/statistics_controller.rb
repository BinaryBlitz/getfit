class Trainer::StatisticsController < Trainer::TrainerController
  def index
    @statistics = TrainerStatistics.new(*date_range, current_trainer)
  end

  private

  def date_range
    from = params[:from]
    to = params[:to]
    [from, to]
  end
end
