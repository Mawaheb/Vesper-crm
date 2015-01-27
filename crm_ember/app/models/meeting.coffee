`import DS from 'ember-data'`

Meeting = DS.Model.extend
  client:     DS.belongsTo('client')
  contacts:   DS.hasMany('contact')
  salesReps:  DS.hasMany('sales-rep')

  memo:       DS.attr('string')
  startDate:  DS.attr('date')
  duration:   DS.attr()

`export default Meeting`