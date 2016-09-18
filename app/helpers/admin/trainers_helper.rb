module Admin::TrainersHelper
  def status_for_trainer(trainer)
    content_tag(:span, class: ['tag', status_tag_class_for_trainer(trainer)]) do
      status_tag_for_trainer(trainer)
    end
  end

  def status_tag_for_trainer(trainer)
    if trainer.approved.nil?
      'На рассмотрении'
    elsif trainer.approved?
      'Одобрено'
    else
      'Отказано'
    end
  end

  def status_tag_class_for_trainer(trainer)
    if trainer.approved.nil?
      'tag-warning'
    elsif trainer.approved?
      'tag-success'
    else
      'tag-danger'
    end
  end
end
