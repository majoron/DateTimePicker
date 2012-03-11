//= require jquery-ui-timepicker-addon

$(function() {
  var fns = ["datetimepicker", "datepicker", "timepicker"];
  for (i=0; i<fns.length; i++) {
    var fn = fns[i];
    $("." + fn).each(function() {
      var picker = $(this);
      var options = $.parseJSON(picker.attr("data-options"));
      picker[fn](options);
    });
  }
});