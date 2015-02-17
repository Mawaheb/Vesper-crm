`import DS from 'ember-data'`

Meeting = DS.Model.extend
  client:     DS.belongsTo('client')
  contacts:   DS.hasMany('contact')
  salesReps:  DS.hasMany('sales-rep',{async: true})
  followUps:  DS.hasMany('follow-up')
  memo:       DS.attr('string')
  startDate:  DS.attr()
  duration:   DS.attr('number')

  hasFollowUps: Ember.computed.notEmpty('followUps')

  salesRepsNames:(->
    return '' unless @get('salesReps')
    names = []
    @get('salesReps').forEach (sr) ->
      names.push(sr.get('name'))
    names
    # TODO, Prettify the output!
  ).property('salesReps')

  durations: [
    {text:'00:15', value:15 },
    {text:'00:30', value:30 },
    {text:'00:45', value:45 },
    {text:'01:00', value:60 },
    {text:'01:15', value:75 },
    {text:'01:30', value:90 },
    {text:'01:45', value:105 },
    {text:'02:00', value:120 },
    {text:'02:15', value:135 },
    {text:'02:30', value:150 },
    {text:'02:45', value:165 },
    {text:'03:00', value:180 }
  ]
  
`export default Meeting`