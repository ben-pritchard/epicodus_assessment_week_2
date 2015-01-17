require("rspec")
require("contact")

describe(Contact) do

  before() do
    Contact.clear()
  end

  describe("#name") do
    it("returns nil if one of the contact fields (name or phone number) was not entered") do
      vaders_digits = Phone.new( {:cell => "503-123-4567", :home => "503-987-6543", :work => "503-503-5003"} )
      vader = Contact.new( {:phone_numbers => vaders_digits} )
      expect(vader.name()).to(eq(nil))
    end
  end

  describe("#name") do
    it("returns the name of the contact") do
      vaders_digits = Phone.new( {:cell => "503-123-4567", :home => "503-987-6543", :work => "503-503-5003"} )
      vader = Contact.new( {:name => "Darth Vader", :phone_numbers => vaders_digits} )
      expect(vader.name()).to(eq("Darth Vader"))
    end
  end

  describe("#phone_numbers") do
    it("returns the name of the contact") do
      yodas_digits = Phone.new( {:cell => "111-111-1111", :home => "111-111-1110", :work => "111-111-1101"} )
      yoda = Contact.new( {:name => "Master Yoda", :phone_numbers => yodas_digits} )
      expect(yoda.phone_numbers()).to(eq(yodas_digits))
    end
  end

  describe(".all") do
    it("returns all the contacts in the phone book - should be empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a contact to the phone book") do
      obiwans_digits = Phone.new( {:cell => "541-472-9635", :home => "503-758-4202", :work => "503-231-1102"} )
      obiwan = Contact.new( {:name => "Ben Kenobi", :phone_numbers => obiwans_digits})
      obiwan.save()
      expect(Contact.all()).to(eq([obiwan]))
    end
  end

  describe(".clear") do
    it("clears the phone book of all contacts") do
      vaders_digits = Phone.new( {:cell => "503-123-4567", :home => "503-987-6543", :work => "503-503-5003"} )
      yodas_digits = Phone.new( {:cell => "111-111-1111", :home => "111-111-1110", :work => "111-111-1101"} )
      obiwans_digits = Phone.new( {:cell => "541-472-9635", :home => "503-758-4202", :work => "503-231-1102"} )
      vader = Contact.new( {:name => "Darth Vader", :phone_numbers => vaders_digits} )
      yoda = Contact.new( {:name => "Master Yoda", :phone_numbers => yodas_digits} )
      obiwan = Contact.new( {:name => "Ben Kenobi", :phone_numbers => obiwans_digits} )
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".list_names") do
    it("provides a list of all the names in the phone book") do
      obiwans_digits = Phone.new( {:cell => "541-472-9635", :home => "503-758-4202", :work => "503-231-1102"} )
      vaders_digits = Phone.new( {:cell => "503-123-4567", :home => "503-987-6543", :work => "503-503-5003"} )
      yodas_digits = Phone.new( {:cell => "111-111-1111", :home => "111-111-1110", :work => "111-111-1101"} )
      obiwan = Contact.new( {:name => "Ben Kenobi", :phone_numbers => obiwans_digits} )
      vader = Contact.new( {:name => "Darth Vader", :phone_numbers => vaders_digits} )
      yoda = Contact.new( {:name => "Master Yoda", :phone_numbers => yodas_digits} )
      vader.save()
      yoda.save()
      obiwan.save()
      expect(Contact.list_names()).to(eq(["Ben Kenobi", "Darth Vader", "Master Yoda"]))
    end
  end

  describe(".find") do
    it("finds a contact in the phone_book based on a name") do
      vaders_digits = Phone.new( {:cell => "503-123-4567", :home => "503-987-6543", :work => "503-503-5003"} )
      yodas_digits = Phone.new( {:cell => "111-111-1111", :home => "111-111-1110", :work => "111-111-1101"} )
      obiwans_digits = Phone.new( {:cell => "541-472-9635", :home => "503-758-4202", :work => "503-231-1102"} )
      vader = Contact.new( {:name => "Darth Vader", :phone_numbers => vaders_digits} )
      yoda = Contact.new( {:name => "Master Yoda", :phone_numbers => yodas_digits} )
      obiwan = Contact.new( {:name => "Ben Kenobi", :phone_numbers => obiwans_digits} )
      vader.save()
      yoda.save()
      obiwan.save()
      expect(Contact.find("Darth Vader")).to(eq(vader))
    end
  end

  describe(".alphabetize") do
    it("alphabetizes the phone_book") do
      vaders_digits = Phone.new( {:cell => "503-123-4567", :home => "503-987-6543", :work => "503-503-5003"} )
      yodas_digits = Phone.new( {:cell => "111-111-1111", :home => "111-111-1110", :work => "111-111-1101"} )
      obiwans_digits = Phone.new( {:cell => "541-472-9635", :home => "503-758-4202", :work => "503-231-1102"} )
      vader = Contact.new( {:name => "Darth Vader", :phone_numbers => vaders_digits} )
      yoda = Contact.new( {:name => "Master Yoda", :phone_numbers => yodas_digits} )
      obiwan = Contact.new( {:name => "Ben Kenobi", :phone_numbers => obiwans_digits} )
      vader.save()
      yoda.save()
      obiwan.save()
      Contact.alphabetize()
      expect(Contact.all()).to(eq([obiwan, vader, yoda]))
    end
  end

  describe(".delete") do
    it("deletes a contact given their name") do
      vaders_digits = Phone.new( {:cell => "503-123-4567", :home => "503-987-6543", :work => "503-503-5003"} )
      yodas_digits = Phone.new( {:cell => "111-111-1111", :home => "111-111-1110", :work => "111-111-1101"} )
      obiwans_digits = Phone.new( {:cell => "541-472-9635", :home => "503-758-4202", :work => "503-231-1102"} )
      vader = Contact.new( {:name => "Darth Vader", :phone_numbers => vaders_digits} )
      yoda = Contact.new( {:name => "Master Yoda", :phone_numbers => yodas_digits} )
      obiwan = Contact.new( {:name => "Ben Kenobi", :phone_numbers => obiwans_digits} )
      vader.save()
      yoda.save()
      obiwan.save()
      Contact.delete("Darth Vader")
      expect(Contact.all()).to(eq([obiwan, yoda]))
    end
  end

end
