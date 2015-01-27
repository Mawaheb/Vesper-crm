`import Ember from 'ember'`

format_date = Ember.Handlebars.makeBoundHelper  (date) ->
  return '' unless date
  format = 'YYYY-MM-DD HH:mm'
  moment(date).format(format)

`export default format_date`