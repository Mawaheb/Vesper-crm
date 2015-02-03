`import DS from 'ember-data'`

SalesRep = DS.Model.extend
  meetings:   DS.hasMany('meeting')
  firstName:  DS.attr('string')
  lastName:   DS.attr('string')
  title:      DS.attr('string')
  phoneNum:   DS.attr('string')
  email:      DS.attr('string')
  sex:        DS.attr('number', {defaultValue: 0})

  isSexUnkown: Ember.computed.equal('sex', 0)
  isSexMale:   Ember.computed.equal('sex', 1)
  isSexFemale: Ember.computed.equal('sex', 2)

  SEXES: [0, 1, 2]
  name:(->
    if ( (@get('firstName') && @get('lastName')) == undefined )
      return 'New Sales-Rep'
    @get('firstName') + ' ' + @get('lastName')
  ).property('firstName', 'lastName')


  # FIXTURES: [
  #   {id: 1, name: "Steeve Jobs"},
  #   {id: 2, name: "Stefan Penar"}
  # ]
`export default SalesRep`