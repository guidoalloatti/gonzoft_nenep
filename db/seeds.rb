# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Guido", fullname: "Guido Alloatti", email: "guido.alloatti@gonzoft.com.ar", password: "admin123")
User.create(name: "Nene", fullname: "Gonzalo Ghanem", email: "nene@nenep.com.ar", password: "admin123")
User.create(name: "Gonzo", fullname: "Nené Peñaranda", email: "gonzo@gonzoft.com.ar", password: "admin123")

# Article.delete_all
# Article.create(title: "Titulo", author: "Gonzo", date: Time.now,detail: "Titulo mas chico, algun dato", text: "Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.", visible: true)
# Article.create(title: "Otro Titulo", author: "Juan", date: Time.now + 4.days, detail: "Titulo mas chico, mas chico todavia", text: "Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.", visible: false)