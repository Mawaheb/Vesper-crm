# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ()->
  $("form.new_sales_rep").on "ajax:success", (event, data, status, xhr) ->
    $('#myModal').modal('hide')
    console.log(data);
    $('table tbody').append('<tr><td>' + data.nf + " " + data.nl + '</td><td>' + data.ttl + '</td><td>' + 
                             data.ph + '</td><td>' + data.em + '</td><td>' + data.sex + '</td></tr>')
