`import startApp from 'crm-ember/tests/helpers/start-app';`

App = null
server = null

module 'Integeration - clients page', 
  setup: -> 
    App = startApp()
    clients = [
      { id: 1, name: 'Mark Twain', contact_ids: [1,2] },
      { id: 2, name: 'Can Atilla', contact_ids: [3] },
      { id: 3, name: 'Charbel Rouhana', contact_ids: [4,5,6] }
    ]

    contacts = [
      { id: 1, name: "Tom Sawyer",      client_id: 1 },
      { id: 2, name: "Huck Fin",        client_id: 1 },
      { id: 3, name: "Tom Dale",        client_id: 2 },
      { id: 4, name: "Yehuda Katz",     client_id: 3 },
      { id: 5, name: "Steff pennar",    client_id: 3 },
      { id: 6, name: "Robert Jackson",  client_id: 3 },
    ]

    server = new Pretender ->
      @get "/api/clients", (request) ->
        [200, {"Content-Type": "application/json" }, JSON.stringify({ clients: clients, contacts: contacts })]

      @get "/api/clients/:id", (request) ->
        client = clients.find((client) ->
          client  if client.id is parseInt(request.params.id, 10)
        )
        [200, {"Content-Type": "application/json"}, JSON.stringify({ client: client, contacts: contacts })]
    
  teardown: -> 
    Ember.run(App, 'destroy')
    server.shutdown()

test 'Should allow navigation to the clients page from the home page', ->
  visit('/').then ->
    click('a:contains("Clients")').then ->
      equal(find('a:contains("clients")').length, 1)

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


test "Should list client's Contacts", ->
  visit('/clients/1').then ->
    equal(find('li:contains("Tom Sawyer")').length, 1)
    equal(find('li:contains("Huck Fin")').length, 1)
