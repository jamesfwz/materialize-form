module SimpleForm
  module Components
    # Needs to be enabled in order to do automatic lookups
    module Tags
      # Name of the component method
      def tag(wrapper_options = nil)
        merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

        text = merged_input_options[:text] == :label_text ? label_text : merged_input_options[:text]
        content_tag(merged_input_options[:tag], text, merged_input_options)
      end

      # Used when the number is optional
      def has_tag?
        tag.present?
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Tags)
