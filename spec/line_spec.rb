require("spec_helper")

describe(Line) do

  describe(".all") do
    it("is empty at first") do
      expect(Line.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a line to the array of saved lines") do
      test_line = Line.new({:name => "Terrapin Station", :id => 1})
      test_line.save()
      expect(Line.all()).to(eq([test_line]))
    end
  end

  describe("#name") do
    it("lets you read the name out") do
      test_line = Line.new({:name => "Terrapin Station", :id => 1})
      expect(test_line.name()).to(eq("Terrapin Station"))
    end
  end

  describe("#id") do
    it("lets you read the station ID out") do
      test_line = Line.new({:name => "Terrapin Station", :id => 1})
      expect(test_line.id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same line if it has the same name and station ID") do
      line1 = Line.new({:name => "Terrapin Station", :id => 1})
      line2 = Line.new({:name => "Terrapin Station", :id => 1})
      expect(line1).to(eq(line2))
    end
  end

end
