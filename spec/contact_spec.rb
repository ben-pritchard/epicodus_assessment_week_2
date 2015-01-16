require("rspec")
require("contact")

describe(Contact) do

  describe("#name") do
    it("returns nil if one of the contact fields (name or phone number) was not entered") do
      vader = Contact.new( {:phone_number => "503-123-4567"} )
      expect(vader.name()).to(eq(nil))
    end
  end

end
