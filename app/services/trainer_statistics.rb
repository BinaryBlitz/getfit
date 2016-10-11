class TrainerStatistics
  attr_reader :programs

  def initialize(trainer, from: 1.month.ago, to: Time.now)
    @trainer = trainer
    @programs = @trainer.programs
    @programs = @programs.where(created_at: from..to) if from.present? && to.present?
    @subscribers = @trainer.subscribers
    @subscribers = @subscribers.where(created_at: from..to) if from.present? && to.present?
  end

  def revenue
    @trainer.programs.sum(&:revenue)
  end

  def subscribers_count
    @subscribers.count
  end

  def total_revenue
    @programs.sum(&:revenue)
  end
end
