require "station"

describe Station do
  context "When using Station" do
    it "should have a zone" do
      station = Station.new("Westminster", 1)
      expect(station.zone).to eq(1)
    end

    it "should have a name" do
      station = Station.new("Westminster", 1)
      expect(station.name).to eq("Westminster")
    end
  end
end
