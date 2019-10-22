require 'oystercard'


describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe "#top_up" do
      it { is_expected.to respond_to(:top_up).with(1).argument }

      it "can top up the balance" do
        expect { subject.top_up(1) }.to change { subject.balance }.by 1
      end

      context "Over the limit" do
        it "Balance will exceed of £#{MAX_BALANCE} maximum" do
          max_balance = Oystercard::MAX_BALANCE
          subject.top_up(max_balance)
          expect { subject.top_up 1}.to raise_error "Maximum balance of #{MAX_BALANCE} exceeded"
        end
      end
    end

    describe "#deduct" do
      it "deducts an amount from the balance" do
        subject.top_up(20)
        expect { subject.deduct 3}.to change { subject.balance }.by -3
      end
      it 'is initially not in a journey' do
        expect(subject).to_not be_in_journey
      end
      it 'can touch in' do
        subject.touch_in
        expect(subject).to be_in_journey
      end
      it 'can touch out' do
        subject.touch_in
        subject.touch_out
        expect(subject).not_to be_in_journey
      end
    end
end
