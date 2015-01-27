`import DS from 'ember-data'`

Meeting = DS.Model.extend
  client:     DS.belongsTo('client')
  contacts:   DS.hasMany('contact')
  salesReps:  DS.hasMany('sales-rep')
  followUps:  DS.hasMany('follow-up')

  memo:       DS.attr('string')
  startDate:  DS.attr('date')
  duration:   DS.attr()

  hasFollowUps: Ember.computed.notEmpty('followUps')
  # TODO, Add followUps.
`export default Meeting`