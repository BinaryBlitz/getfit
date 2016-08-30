class TrainerStatistics
  def initialize(from = nil, to = nil, trainer)
    @trainer = trainer
    @programs = @trainer.programs
    @programs = @trainer.programs.where(created_at: from..to) if from.present? && to.present?
    @subscribers = @trainer.subscribers
    @subscribers = @trainer.subscribers.where(created_at: from..to) if from.present? && to.present?
  end

  def programs
    @programs
  end

  def total_revenue
    @trainer.programs.sum(&:trainer_revenue)
  end

  def subscribers_count_on_date
    @subscribers.count
  end

  def total_revenue_on_date
    @programs.sum(&:trainer_revenue)
  end
end
