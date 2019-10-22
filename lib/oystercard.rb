class Oystercard

MAXIMUM_BALANCE = 90

MINIMUM_BALANCE = 1

  attr_reader :balance, :in_use, :entry_station

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "Maximum balance of 90 exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    !entry_station.nil?
  end

  def touch_in(station)
    raise "insufficient balance" if @balance < MINIMUM_BALANCE
    @in_use = true
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
