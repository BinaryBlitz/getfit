module Admin::TrainersHelper
  def status_for_trainer(trainer)
    content_tag(:span, class: ['label', status_label_class_for_trainer(trainer)]) do
      status_label_for_trainer(trainer)
    end
  end

  def status_label_for_trainer(trainer)
    if trainer.approved.nil?
      'На рассмотрении'
    elsif trainer.approved?
      'Одобрено'
    else
      'Отказано'
    end
  end

  def status_label_class_for_trainer(trainer)
    if trainer.approved.nil?
      'label-warning'
    elsif trainer.approved?
      'label-success'
    else
      'label-danger'
    end
  end
end
