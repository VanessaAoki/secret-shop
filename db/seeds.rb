# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

news = Category.create(id: 1, name: 'News', priority: 1)
events = Category.create(id: 2, name: 'Events', priority: 2)
patch = Category.create(id: 3, name: 'Patch Notes', priority: 2)
releases = Category.create(id: 4, name: 'Releases', priority: 2)
dota = Category.create(id: 5, name: 'Dota', priority: 3)
valorant = Category.create(id: 6, name: 'VALORANT', priority: 3)
league = Category.create(id: 7, name: 'LOL', priority: 3)
cs = Category.create(id: 8, name: 'CS:GO', priority: 3)

admin = User.create(name: "Admin", email: "admin@admin.com", password: "123456", admin: true)
editor = User.create(name: "Editor", email: "editor@editor.com", password: "123456", admin: true)
foobar = User.create(name: "Foo Bar", email: "foo@bar.com", password: "123456")

events.articles.create(author_id: 2, title: "CS:GO – DreamHack Summer 2021", text: "02.07 - 04.07 ")

events.articles.create(author_id: 2, title: "Dota 2 –The International 2021", text: "05.08 - 15.08 ")
