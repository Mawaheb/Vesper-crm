`import Ember from 'ember'`
SalesRepsNewRoute = Ember.Route.extend

  model: ->
    # Em.Object.create()
    @store.createRecord('sales-rep')
            
  setupController: (controller, model) ->
    @controllerFor('sales-rep/new').set('model', model)

  renderTemplate: ->
    @render('sales-rep/edit',
      controller: 'sales-rep/new'
    )
`export default SalesRepsNewRoute`