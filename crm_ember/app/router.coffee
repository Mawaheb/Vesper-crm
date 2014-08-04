`import Ember from 'ember'`

Router = Ember.Router.extend 
  location: CrmEmberENV.locationType


Router.map () ->
  @route 'about'

  @resource 'clients', ->
    @route 'new'
    @resource 'clients.client', path: '/:id', ->
      @route 'edit'

  # @resource "sales-reps", ->
  #   @route 'show', path: ':srep_id'



`export default Router`
