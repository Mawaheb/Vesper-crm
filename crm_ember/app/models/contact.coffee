`import DS from 'ember-data'`

contact = DS.Model.extend
  client: DS.belongsTo('client'),
  firstName: DS.attr('string'),
  lastName:  DS.attr('string')

  name: (->
    [@get('firstName'), @get('lastName')].join(' ')
    ).property('firstName','lastName')

`export default contact`