`import DS from 'ember-data'`

Contact = DS.Model.extend
  client: DS.belongsTo('client'),
  # meetings:  DS.hasMany('meeting'),
  firstName: DS.attr('string'),
  lastName:  DS.attr('string'),
  title:     DS.attr('string'),    
  phoneNum:  DS.attr('string'), 
  email:     DS.attr('string')

  name: (->
    [@get('firstName'), @get('lastName')].join(' ')
  ).property('firstName','lastName')

`export default Contact`