class DateTimeInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    input_html_options[:class] << "form-control"
    @builder.text_field(attribute_name, input_html_options)
  end
end
