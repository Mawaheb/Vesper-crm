`import DS from 'ember-data'`

Meeting = DS.Model.extend
  client:     DS.belongsTo('client')
  contacts:   DS.hasMany('contact', {async: false})
  salesReps:  DS.hasMany('sales-rep', {async: true})
  followUps:  DS.hasMany('follow-up')

  memo:       DS.attr('string')
  startDate:  DS.attr('date')
  duration:   DS.attr()

  hasFollowUps: Ember.computed.notEmpty('followUps')

  salesRepsNames:(->
    return '' unless @get('salesReps')
    names = []
    @get('salesReps').forEach (sr) ->
      names.push(sr.get('name'))
    names
    # TODO, Prettify the output!
  ).property('salesReps')
  
`export default Meeting`