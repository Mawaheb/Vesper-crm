`import DS from 'ember-data'`

SalesRep = DS.Model.extend
  firstName:  DS.attr('string')
  lastName:   DS.attr('string')
  title:      DS.attr('string')
  phoneNum:   DS.attr('string')
  email:      DS.attr('string')
  sex:        DS.attr('string')
  SEXES:      [0, 1, 2]

  name:(->
    @get('firstName') + ' ' + @get('lastName')
  ).property('firstName', 'lastName')


  # FIXTURES: [
  #   {id: 1, name: "Steeve Jobs"},
  #   {id: 2, name: "Stefan Penar"}
  # ]
`export default SalesRep`