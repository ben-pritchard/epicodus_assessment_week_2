class Contact
  attr_reader(:name, :phone_numbers)

  @@phone_book = []

  define_method(:initialize) do |info|
    @name = info[:name]
    @phone_numbers = info[:phone_numbers]
  end

  define_singleton_method(:all) do
    @@phone_book
  end

  define_method(:save) do
    @@phone_book.push(self)
    Contact.alphabetize()
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

  define_singleton_method(:find) do |name|
    return_contact = nil
    @@phone_book.each() do |contact|
      if name == contact.name()
        return_contact = contact
        break
      end
    end
    return_contact
  end

  define_singleton_method(:alphabetize) do
    @@phone_book.sort! { |a,b| a.name.downcase <=> b.name.downcase }
  end

end
