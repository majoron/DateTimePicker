//= require jquery-ui-timepicker-addon
//= require jquery-ui-sliderAccess

$(function() {
  var fns = ["datetimepicker", "datepicker", "timepicker"];
  for (i=0; i<fns.length; i++) {
    var fn = fns[i];
    $("." + fn).each(function() {
      var picker = $(this);
      var options = $.parseJSON(picker.attr("data-options"));
      var locale = picker.attr("data-locale");
      if (locale != "en") {
        $.datepicker.setDefaults($.datepicker.regional[locale]);
        $.timepicker.setDefaults($.timepicker.regional[locale]);
      }
      picker[fn](options);
    });
  }
});
