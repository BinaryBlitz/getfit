class TrainerStatistics
  attr_reader :programs

  def initialize(trainer, from = nil, to = nil)
    @trainer = trainer
    @programs = @trainer.programs.general
    @programs = @programs.where(created_at: from..to) if from.present? && to.present?
    @subscribers = @trainer.subscribers
    @subscribers = @subscribers.where(created_at: from..to) if from.present? && to.present?
  end

  def revenue
    @programs.sum('price * users_count')
  end

  def subscribers_count
    @subscribers.count
  end
end
