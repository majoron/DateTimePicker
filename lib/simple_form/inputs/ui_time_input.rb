class UiTimeInput < SimpleForm::Inputs::Base
  def input
    @builder.time_picker(attribute_name, input_html_options)
  end
end