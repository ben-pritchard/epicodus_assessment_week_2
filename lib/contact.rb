class Contact
  attr_reader(:name, :phone_number)

  @@phone_book = []

  define_method(:initialize) do |info|
    @name = info[:name]
    @phone_number = info[:phone_number]
  end

  define_singleton_method(:all) do
    @@phone_book
  end

  define_method(:save) do
    @@phone_book.push(self)
  end

  define_singleton_method(:clear) do
    @@phone_book = []
  end

  define_singleton_method(:list_names) do
    @names = []
    @@phone_book.each() do |contact|
      @names.push(contact.name())
    end
    @names
  end

end
