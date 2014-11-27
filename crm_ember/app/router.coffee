`import Ember from 'ember'`

Router = Ember.Router.extend 
  location: CrmEmberENV.locationType


Router.map () ->
  @route 'about'

  @resource 'clients', ->
    @route 'new'
    @resource 'client', path: '/:client_id', ->
      @route 'edit'

  # @resource "sales-reps", ->
  #   @route 'show', path: ':srep_id'



`export default Router`
