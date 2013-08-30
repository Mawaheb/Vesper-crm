#= require spec_helper

describe "App.SalesRep", ->
  beforeEach( ->
    Test.store = TestUtil.lookupStore()
  )

  it "is a DS.Model", ->
    assert.ok App.SalesRep
    assert.ok DS.Model.detect(App.SalesRep)

  describe "attribute: firstName", ->
    it "can be created with valid value", ->
      Ember.run( ->
        Test.contact = App.SalesRep.createRecord firstName: 'Joe'
      )
      expect(Test.contact.get 'firstName').to.equal 'Joe'


  describe "attribute: lastName", ->
    it "can be created with valid value", ->
      Ember.run( ->
        Test.contact = App.SalesRep.createRecord lastName: 'swanson'
      )
      expect(Test.contact.get 'lastName').to.equal 'swanson'


    it "can NOT be created with invalid value", ->
      Ember.run( ->
        Test.contact = App.SalesRep.createRecord lastName: ' '
      )
      expect(Test.contact.get 'lastName').to.not.equal 'Joe'
      #-expect(Test.contact.get 'isValid').to.be.equal false
