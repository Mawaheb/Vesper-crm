`import Ember from 'ember'`
SalesRepIndexController = Ember.ObjectController.extend

  actions:
    delete: ->
      if window.confirm("Are you sure you want to delete this SalesRep?")
        @get('model').destroyRecord().then =>
          @transitionToRoute 'sales-reps.index'

`export default SalesRepIndexController


















`