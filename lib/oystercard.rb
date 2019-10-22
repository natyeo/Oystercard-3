class Oystercard

MAXIMUM_BALANCE = 90

MINIMUM_BALANCE = 1

  attr_reader :balance, :in_use

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "Maximum balance of 90 exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_use
  end

  def touch_in
    raise "insufficient balance" if @balance < MINIMUM_BALANCE
    @in_use = true
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @in_use = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
