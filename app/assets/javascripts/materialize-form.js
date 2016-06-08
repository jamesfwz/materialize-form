window.materializeForm = {
  init: function() {
    this.initSelect()
    this.initCheckbox()
    this.initDate()  
  },
  initSelect: function() {
    $('select[multiple="multiple"] option[value=""]').attr('disabled', true)
    $('select').material_select()
  },
  initCheckbox: function() {
    $('input[type=checkbox]').addClass('filled-in')
  },
  initDate: function() {
    $('input.date').pickadate({
      selectMonths: true, 
      selectYears: 100
    });
  }
}

$(document).ready(function() {
  window.materializeForm.init()
});

$(document).ajaxSuccess(function() {
  window.materializeForm.init()
});
