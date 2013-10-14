# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $(".date-time-picker").datetimepicker
    dateFormat: 'yy-mm-dd'

  $(".date-picker").datepicker
    dateFormat: 'yy-mm-dd'  