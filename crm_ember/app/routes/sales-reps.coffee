`import Ember from 'ember'`

SalesRepsRoute = Ember.Route.extend
  model: ->
    # @store.find('sales-rep')
    # the query left blank in order to get all salesReps from the server.
    @store.filter('sales-rep', {} ,(sr) ->
      !sr.get('isNew')
    )  
      

`export default SalesRepsRoute`