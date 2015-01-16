class Contact
  attr_reader(:name, :phone_number)

  @@phone_book = []

  define_method(:initialize) do |info|
    @name = info[:name]
    @phone_number = info[:phone_number]
  end

end
