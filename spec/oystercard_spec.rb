require 'oystercard'

describe Oystercard do
  let(:station){ double :station }

  context "card initialised" do
    it 'has a balance of zero' do
      expect(subject.balance).to eq(0)
    end

    it 'is not in a journey' do
      expect(subject).to_not be_in_journey
    end
  end

    describe "#top_up" do

      it "can top up the balance" do
        expect { subject.top_up(1) }.to change { subject.balance }.by 1
      end

      it "raises an error if the maximum balance is excceeded" do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up(maximum_balance)
        expect { subject.top_up 1}.to raise_error "Maximum balance of #{maximum_balance} exceeded"
      end
    end

  context "touching in" do
    it 'raises an error when insufficient balance' do
      expect { subject.touch_in(station) } .to raise_error "insufficient balance"
    end

    it 'can touch in' do
      subject.top_up(1)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it 'remembers entry station' do
      subject.top_up(1)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  context "touching out" do
    it 'can touch out' do
      subject.top_up(1)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject).not_to be_in_journey
    end

    it 'remembers exit stationn' do
      # subject.top_up(1)
      subject.touch_out(station)
      expect(subject.exit_station).to eq station
    end


    it 'deducts fare' do
      subject.top_up(2)
      subject.touch_in(station)
      expect{ subject.touch_out(station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_BALANCE)
    end
  end
end
