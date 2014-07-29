# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mark    = Client.create!(name: 'Mark Twain')
can     = Client.create!(name: 'Can Atilla')
charbel = Client.create!(name: 'Charbel Rouhana')

mark.contacts.create!(first_name: 'Tom', last_name: 'Sawyer')
mark.contacts.create!(first_name: 'Huck', last_name: 'Fin')

can.contacts.create!(first_name: 'Tom', last_name: 'Dale')

charbel.contacts.create!(first_name: 'Yehuda',last_name: 'Katz')
charbel.contacts.create!(first_name: 'Steff', last_name: 'pennar')
charbel.contacts.create!(first_name: 'Robert', last_name: 'Jackson')
