`import Ember from 'ember'`
MeetingsNewController = Ember.ObjectController.extend
  durations: Ember.String.w "00:15 00:30 00:45 01:00 01:15 01:30 01:45 02:00 02:15 02:30 02:45 03:00"
  client: null
  contactsArr: []
  selectedSalesReps: Ember.computed.alias('model.salesReps')

  fetchContacts:(->
    @get('contactsArr').clear() #resetting contactsArr array
    contacts = @get('client').get('contacts')
    @set('contactsArr', contacts)
  ).observes('client')

  actions:
    assignSReps:(sr) ->
      selectedSalesReps = @get('selectedSalesReps')
      if selectedSalesReps.contains(sr)
        selectedSalesReps.removeObject(sr)
      else
        selectedSalesReps.addObject(sr)


    assignContacts:(contact)->
      cntcs = @get('model').get('contacts')

      if cntcs.contains(contact)
        cntcs.removeObject(contact)
      else
        cntcs.addObject(contact)

    save: ->
      meeting = @get('model')
      meeting.set('client', @get('client'))
      meeting.save().then =>
        @transitionToRoute 'meetings'

    cancel: ->
      @transitionToRoute 'meetings'

`export default MeetingsNewController`