`import startApp from 'crm-ember/tests/helpers/start-app';`

App = null

module('Integration - home page',{
  setup: -> App = startApp()
  teardown: -> Ember.run(App, 'destroy')
})

test "It should welcome the user to Vesper-crm", ->
  visit('/').then ->
    equal(find('h2#title').text(), 'Welcome to Vesper-crm')


test "Should allow navigating back to root from other pages", ->
  visit('/about').then ->
    click('a:contains("Home")').then ->
      notEqual(find('h3').text(), 'About')