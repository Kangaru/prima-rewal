class Forms::Builders::Reservation < SimpleForm::FormBuilder
  def input(attribute_name, options = {}, &block)
    options[:input_html] ||= {}

    options[:input_html][:class] = 'input-medium'
    options[:input_html][:rows]  = 3 if options[:as] == :text


    options[:required] = false

    super(attribute_name, options, &block)
  end

  def button(type, *args, &block)
    args << { class: %w{btn-large btn-primary btn-info} }
    super(type, *args, &block)
  end
end