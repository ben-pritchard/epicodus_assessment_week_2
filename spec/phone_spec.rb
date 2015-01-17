require("rspec")
require("phone")

describe(Phone) do

  describe("#home") do
    it("returns nil if one of the phone number fields (cell, home, or work) was not entered") do
      vaders_digits = Phone.new( {:cell => "503-123-4567"} )
      expect(vaders_digits.work()).to(eq(nil))
    end
  end

  describe("#cell") do
    it("returns the cell phone number stored") do
      vaders_digits = Phone.new( {:cell => "503-123-4567", :home => "503-987-6543", :work => "503-503-5003"} )
      expect(vaders_digits.cell()).to(eq("503-123-4567"))
    end
  end

  describe("#home") do
    it("returns the home phone number stored") do
      vaders_digits = Phone.new( {:cell => "503-123-4567", :home => "503-987-6543", :work => "503-503-5003"} )
      expect(vaders_digits.home()).to(eq("503-987-6543"))
    end
  end

  describe("#work") do
    it("returns the work phone number stored") do
      vaders_digits = Phone.new( {:cell => "503-123-4567", :home => "503-987-6543", :work => "503-503-5003"} )
      expect(vaders_digits.work()).to(eq("503-503-5003"))
    end
  end

  describe("#add_cell") do
    it("adds a cell number") do
      vaders_digits = Phone.new( {:home => "503-987-6543", :work => "503-503-5003"} )
      vaders_digits.add_cell("503-503-5000")
      expect(vaders_digits.cell()).to(eq("503-503-5000"))
    end
  end

  describe("#add_home") do
    it("adds a cell number") do
      vaders_digits = Phone.new( {:cell => "503-987-6543", :work => "503-503-5003"} )
      vaders_digits.add_home("503-503-5000")
      expect(vaders_digits.home()).to(eq("503-503-5000"))
    end
  end

  describe("#add_work") do
    it("adds a cell number") do
      vaders_digits = Phone.new( {:cell => "503-987-6543", :work => "503-503-5003"} )
      vaders_digits.add_work("503-503-5000")
      expect(vaders_digits.work()).to(eq("503-503-5000"))
    end
  end
end
