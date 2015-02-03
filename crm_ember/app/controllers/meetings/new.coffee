`import Ember from 'ember'`
MeetingsNewController = Ember.ObjectController.extend
  durations: Ember.String.w "00:15 00:30 00:45 01:00 01:15 01:30 01:45 02:00 02:15 02:30 02:45 03:00"
  client: null
  contactsArr: []
  # selectedContacts: []
  # selectedSalesReps: []

  fetchContacts:(->
    @get('contactsArr').clear() #resetting contactsArr array
    contacts = @get('client').get('contacts')
    # return unless (contacts.get('length') > 0)
    # arr = []
    # contacts.forEach (c) ->
    #   arr.pushObject({name: c.get('name'), id: c.get('id')})
    @set('contactsArr', contacts)
  ).observes('client')

  actions:
    assignSReps:(sr) ->
      sReps = @get('model').get('salesRepIDs')
      srId = sr.get('id')
      if sReps.contains(srId)
        sReps.removeObject(srId)
      else
        sReps.addObject(srId)


    assignContacts:(contact)->
      cntcs = @get('model').get('contacts')

      if cntcs.contains(contact)
        cntcs.removeObject(contact)
      else
        cntcs.addObject(contact)

    save: ->
      # console.log(@get('salesReps.content'))
      meeting = @get('model')
      meeting.set('client', @get('client'))
      # meeting.get('salesReps').pushObjects(@get('salesReps.content'))
      meeting.save().then =>
        @transitionToRoute 'meetings'

    cancel: ->
      @transitionToRoute 'meetings'

`export default MeetingsNewController`