class DateTimeInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    input_html_options[:class] << "form-control"
    @builder.text_field(attribute_name, input_html_options)
  end

  def input_html_options
    existing_options = super

    if existing_options.include? :value
      existing_options
    else
      existing_options.merge({value: formatted_attribute_value(attribute_name)})
    end
  end

  private

  def formatted_attribute_value(attribute_name)
    attribute_value(attribute_name).try(:strftime, '%e %B, %Y')
  end

  def attribute_value(attribute_name)
    @builder.object.public_send(attribute_name)
  end
end
