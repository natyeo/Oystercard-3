require 'journey'

describe Journey do

  it 'is initialized with start and end attributes' do
    expect(subject).to have_attributes(:origin => "", :destination => "")
  end

 describe '#started?' do
   it 'should determine if trip has started' do
     expect(subject.started?).to eq false
   end
 end

  describe '#ended' do
    it 'should determine if trip has ended' do
      expect(subject.ended?).to eq false
    end
  end

  describe '#fare' do

    it 'should calculate fare' do
      complete_journey = Journey.new("Old Street", "Highgate")
      expect(complete_journey.fare).to eq Journey::MINIMUM_FARE
    end

    it 'should return 6 if no entry or end station' do
      incomplete_journey = Journey.new("Old Street", "")
      expect(incomplete_journey.fare).to eq Journey::PENALTY_FARE
    end
  end

  describe '#complete?' do
    it 'returns whether or not journey is complete' do
      expect(subject.complete?).to eq false
    end
  end
end
