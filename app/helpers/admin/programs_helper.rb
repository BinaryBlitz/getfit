module Admin::ProgramsHelper
  def status_for_program(program)
    content_tag(:span, class: ['tag', status_tag_class_for_program(program)]) do
      status_tag_for_program(program)
    end
  end

  def status_tag_for_program(program)
    if program.approved.nil?
      'На рассмотрении'
    elsif program.approved?
      'Одобрено'
    else
      'Отказано'
    end
  end

  def status_tag_class_for_program(program)
    if program.approved.nil?
      'tag-warning'
    elsif program.approved?
      'tag-success'
    else
      'tag-danger'
    end
  end
end
