`import startApp from 'crm-ember/tests/helpers/start-app';`

App = null

module('Integration - About page',{
  setup: -> App = startApp()
  teardown: -> Ember.run(App, 'destroy')
})

test "Should navigate to the About page", ->
  visit('/').then ->
    click("a:contains('About')").then ->
      equal(find('h3').text(), 'About')