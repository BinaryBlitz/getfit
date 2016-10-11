class TrainerStatistics
  attr_reader :programs

  def initialize(trainer, from = nil, to = nil)
    @trainer = trainer
    @programs = @trainer.programs.general
    @programs = @programs.where(created_at: from..to) if from && to
    @subscribers = @trainer.subscribers
    @subscribers = @subscribers.where(created_at: from..to) if from && to
  end

  def revenue
    @programs.sum(&:revenue)
  end

  def subscribers_count
    @subscribers.count
  end
end
