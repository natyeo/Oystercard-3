class Oystercard

MAX_BALANCE = 90

  attr_reader :balance, :journey_history #to track card use

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    fail ("Balance will exceed of £#{MAX_BALANCE} maximum") if amount + balance > MAX_BALANCE
    @balance += amount
  end


  def in_journey?
    true
  end

  def touch_in
    true
  end


    def touch_out
      false
    end

     private
    def deduct(amount)
      @balance -= amount
    end

end
