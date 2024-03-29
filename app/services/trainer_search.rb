class TrainerSearch
  def initialize(options = {})
    @options = options
  end

  def trainers
    @trainers ||= find_trainers
  end

  private

  def find_trainers
    trainers = Trainer.all
    trainers = trainers.order(@options[:order] => :desc) if @options[:order].present?

    if @options[:specialization_id].present?
      trainers = trainers.where(specialization_id: @options[:specialization_id])
    end

    trainers = trainers.where(category: @options[:category]) if @options[:category].present?
    trainers
  end
end
