require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/phone")
require("./lib/contact")
require("pry")

get("/") do
  @phone_book = Contact.all()
  erb(:index)
end

post("/index") do
  name = params.fetch("name")
  cell = params.fetch("cell")
  home = params.fetch("home")
  work = params.fetch("work")

  if name == ""
    name = "No Name Bob"
  end

  new_phone = Phone.new( {:cell => cell, :home => home, :work => work} )
  new_contact = Contact.new( {:name => name, :phone_numbers => new_phone} )
  new_contact.save()

  redirect("/")
end

get("/contact/:name") do
  found_contact = Contact.find(params.fetch("name"))
  @name = found_contact.name()
  erb(:contact)
end

get("/clear") do
  Contact.clear()

  redirect("/")
end

post("/delete") do
  Contact.delete(params.fetch("delete_name"))

  redirect("/")
end

post("/add_cell") do
  cell = params.fetch("new_cell")
  name = Contact.get_transporter()

  Contact.find(name).phone_numbers().add_cell(cell)

  redirect("/")
end

post("/add_home") do
  cell = params.fetch("new_home")
  name = Contact.get_transporter()

  Contact.find(name).phone_numbers().add_home(cell)

  redirect("/")
end

post("/add_work") do
  cell = params.fetch("new_work")
  name = Contact.get_transporter()

  Contact.find(name).phone_numbers().add_work(cell)

  redirect("/")
end

post("/insert_cell") do
  cell = params.fetch("new_cell")
  name = Contact.get_transporter()

  Contact.find(name).phone_numbers().add_cell(cell)

  redirect("/contact/#{name}")
end

post("/insert_home") do
  cell = params.fetch("new_home")
  name = Contact.get_transporter()

  Contact.find(name).phone_numbers().add_home(cell)

  redirect("/contact/#{name}")
end

post("/insert_work") do
  cell = params.fetch("new_work")
  name = Contact.get_transporter()

  Contact.find(name).phone_numbers().add_work(cell)

  redirect("/contact/#{name}")
end
