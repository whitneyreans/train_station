require("spec_helper")


describe(Stop) do
  describe("#save") do
    it("lets you save stations to the database") do
      station = Station.new({:name => "Terrapin Station", :id => nil})
      station.save()
      expect(Station.all()).to(eq([station]))
    end
  end
end
