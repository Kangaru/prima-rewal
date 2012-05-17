class Forms::Builders::Reservation < SimpleForm::FormBuilder
  def input(attribute_name, options = {}, &block)
    options[:input_html] ||= {}

    options[:input_html][:class] = 'input-medium'

    if options[:as] == :date
      options[:input_html][:class] = 'span1'

      options[:start_year] = Date.today.year
      options[:end_year]   = Date.today.year + 2
    end

    options[:input_html][:rows]  = 3 if options[:as] == :text


    options[:required] = false

    super(attribute_name, options, &block)
  end

  def button(type, *args, &block)
    args << { class: %w{btn-large btn-primary btn-info} }
    super(type, *args, &block)
  end
end