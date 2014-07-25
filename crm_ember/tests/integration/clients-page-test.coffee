`import startApp from 'crm-ember/tests/helpers/start-app';`

App = null
server = null

module 'Integeration - clients page', 
  setup: -> 
    App = startApp()
    clients = [
      {
        id: 1,
        name: 'Mark Twain'
      },
      {
        id: 2,
        name: 'Can Atilla'
      },
      {
        id: 3,
        name: 'Charbel Rouhana'
      }
    ]

    server = new Pretender ->
      @get "/api/clients", (request) ->
        [200, {"Content-Type": "application/json" }, JSON.stringify(clients: clients)]

      @get "/api/clients/:id", (request) ->
        client = clients.find((client) ->
          client  if client.id is parseInt(request.params.id, 10)
        )
        [200, {"Content-Type": "application/json"}, JSON.stringify(client: client)]
    
  teardown: -> 
    Ember.run(App, 'destroy')
    server.shutdown()

test 'Should allow navigation to the clients page from the home page', ->
  visit('/').then ->
    click('a:contains("Clients")').then ->
      equal(find('h3').text(), 'Clients')

test 'Should list all clients', ->
  visit('/clients').then ->
    equal(find('a:contains("Mark Twain")').length, 1)
    equal(find('a:contains("Can Atilla")').length, 1)
    equal(find('a:contains("Charbel Rouhana")').length, 1)


test 'Should be able to navigate to a client page', ->
  visit('/clients').then ->
    click('a:contains("Mark Twain")').then ->
      equal(find('h4').text(), 'Mark Twain')


test 'Should be able to visit a speaker page', ->
  visit('/clients/1').then ->
    equal(find('h4').text(), 'Mark Twain')