App.FollowupController = Ember.ObjectController.extend({
  isAdding: false,

  add: function() {
  	this.set('isAdding', true);
  },

  doneAdding: function() {
  	this.set('isAdding', false);
  }

});
