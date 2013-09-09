App.ClientsNewController = Ember.ObjectController.extend({
  model: function() {
    return App.Client.createRecord();
  },
  
  save: function() {
    this.get("model.transaction").commit();
    this.get("target").transitionTo("clients");
  },

  


});