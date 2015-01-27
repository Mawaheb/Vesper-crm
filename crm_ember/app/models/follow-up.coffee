`import DS from 'ember-data'`

FollowUp = DS.Model.extend
  meeting:  DS.belongsTo('meeting')
  salesRep: DS.belongsTo('sales-rep')

  type:         DS.attr()
  memo:         DS.attr('string')
  done:         DS.attr('boolean')
  status:       DS.attr()
  dueDate:      DS.attr('date')
  completeDate: DS.attr('date')

`export default FollowUp`