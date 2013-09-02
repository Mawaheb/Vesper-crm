App.MeetingsRoute = Ember.Route.extend({
   setupController:function(controller,model) {
       this._super(controller,model);
       controller.set('clientsForSelect',App.Client.find());       
    }
	
});