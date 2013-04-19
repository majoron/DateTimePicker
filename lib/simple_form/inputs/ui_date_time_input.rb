class UiDateTimeInput < SimpleForm::Inputs::Base
  def input
    @builder.date_time_picker(attribute_name, input_html_options)
  end
end