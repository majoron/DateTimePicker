//= require jquery-ui-timepicker-addon

$(function() { //FIXME
   $(".datepicker").each(function() {
     var picker = $(this);
     var options = $.parseJSON(picker.attr("data-options"));
     picker.datepicker(options);
   });
   $(".datetimepicker").each(function() {
     var picker = $(this);
     var options = $.parseJSON(picker.attr("data-options"));
     picker.datetimepicker(options);
   });
   $(".timepicker").each(function() {
     var picker = $(this);
     var options = $.parseJSON(picker.attr("data-options"));
     picker.timepicker(options);
   });
});