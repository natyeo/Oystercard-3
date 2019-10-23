require "station"

describe Station do

  subject {described_class.new("Westminster", 1)}

  context "When using Station" do
    it "should have a zone" do
      expect(subject.zone).to eq(1)
    end

    it "should have a name" do
      expect(subject.name).to eq("Westminster")
    end
  end
end
