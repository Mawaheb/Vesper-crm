`import Ember from 'ember'`
MeetingsNewController = Ember.ObjectController.extend
  durations: Ember.String.w "00:15 00:30 00:45 01:00 01:15 01:30 01:45 02:00 02:15 02:30 02:45 03:00"
  client: null
  contactsArr: []

  fetchContacts:(->
    @get('contactsArr').clear() #resetting contactsArr array
    contacts = @get('client').get('contacts')
    return unless (contacts.get('length') > 0)
    arr = []
    contacts.forEach (c) ->
      arr.pushObject({name: c.get('name'), id: c.get('id')})
    @get('contactsArr').pushObjects(arr)
  ).observes('client')

  # selectSR: undefined
  # watchSelectSR:( ->
  #   alert(@get('name'))
  # ).observes('selectSR')

  actions:
    test:(value, checked, id) ->
      alert('clicked ID: ' + id)
      # @get('test').pushObject({name:3})
      # console.log(@get('contactsArr'))
      # names = []
      # @get('clients').forEach (c) =>
      #   o = Ember.Object.create({name: c.get('name'), id: c.get('id')})
      #   names.addObject(o)
      # console.log(names)
    cancel: ->
      @transitionToRoute 'meetings'

`export default MeetingsNewController`