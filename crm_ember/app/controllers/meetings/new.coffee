`import Ember from 'ember'`
MeetingsNewController = Ember.ObjectController.extend
  client: Ember.computed.alias('model.client')
  contactsArr: new Array()
  selectedSalesReps: []
  # selectedSalesReps: Ember.computed.alias('model.salesReps')
  duarionts: Ember.computed.alias('model.durations')
  # duration: Ember.computed.alias('model.duration')

  fetchContacts:(->
    client = @get('client')
    if client 
      @get('contactsArr').clear() #resetting contactsArr array
      contacts = client.get('contacts')
      @set('contactsArr', contacts)
  ).observes('client')

  isNewMeeting:(->
    @get('model.isNew') ? true:false
  ).property('model.isNew')

  isSelected:((key, value)->
    model = @get('model')
    if value is 'undefined'
      model.g
    @get('model').get('salesReps').contains(value)
  ).property('model.salesReps')

  actions:
    assignSReps:(sr, checked) ->
      sales = @get('model').get('salesReps')
      if checked
        sales.addObject(sr)
      else
        sales.removeObject(sr)
      # sales = @get('model').get('salesReps')
      # if sales.contains(sr)
      #   sales.removeObject(sr)
      # else
      #   sales.addObject(sr)

    assignContacts:(contact)->
      cntcs = @get('model').get('contacts')

      if cntcs.contains(contact)
        cntcs.removeObject(contact)
      else
        cntcs.addObject(contact)

    save: ->
      alert(@get('model').get('salesReps'))
      # meeting = @get('model')
      # meeting.set('client', @get('client'))
      # meeting.save().then =>
      #   @transitionToRoute 'meetings'

    cancel: ->
      @get('model').rollback()
      @transitionToRoute 'meetings'

    delete: ->
      if confirm("Are you sure you want to delete this Meeting?")
        @get('model').destroyRecord().then =>
          @transitionToRoute 'meetings'

`export default MeetingsNewController`