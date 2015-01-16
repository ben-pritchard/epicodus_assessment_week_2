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
