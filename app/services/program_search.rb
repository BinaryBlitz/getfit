class ProgramSearch
  def initialize(options = {})
    @options = options
  end

  def programs
    @programs ||= find_programs
  end

  private

  def find_programs
    programs = Program.approved
    programs = programs.order(@options[:order]) if @options[:order].present?

    if @options[:program_type_id].present?
      programs = programs.where(program_type_id: @options[:program_type_id])
    end

    programs = programs.where('price >= ?', @options[:min_price]) if @options[:min_price].present?
    programs = programs.where('price <= ?', @options[:max_price]) if @options[:max_price].present?
    programs
  end
end
