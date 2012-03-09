//= require ../picker/jquery-ui-timepicker-addon
//= require_tree ../picker/localization

$("hasDatepicker").each(function() {
  var picker = $(this);
  var fn = window[picker.attr("data-function")];
  var options = $.parseJSON(picker.attr("data-options"));
  picker[fn](options)
});