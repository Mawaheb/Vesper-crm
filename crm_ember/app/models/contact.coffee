`import DS from 'ember-data'`

contact = DS.Model.extend
  client: DS.belongsTo('client'),
  name: DS.attr('string')

`export default contact`