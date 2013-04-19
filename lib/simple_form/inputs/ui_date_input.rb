class UiDateInput < SimpleForm::Inputs::Base
  def input
    @builder.date_picker(attribute_name, input_html_options)
  end
end