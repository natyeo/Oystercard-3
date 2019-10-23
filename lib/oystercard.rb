class Oystercard

MAXIMUM_BALANCE = 90

MINIMUM_BALANCE = 1

  attr_reader :balance, :in_use, :current_journey, :journey_history

  def initialize
    @balance = 0
    @in_use = false
    @journey_history = []
    @current_journey = {:entry => "", :exit => ""}
  end

  def top_up(amount)
    fail "Maximum balance of 90 exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_use == true
  end

  def touch_in(station)
    raise "insufficient balance" if @balance < MINIMUM_BALANCE
    @in_use = true
    @current_journey[:entry] = station
  end

  def touch_out(station)
    deduct(MINIMUM_BALANCE)
    @current_journey[:exit] = station
    @journey_history << @current_journey
    @in_use = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
