class Journey
  PENALTY_FARE = 6
  MINIMUM_FARE = 1
  attr_accessor :origin, :destination

  def initialize(origin = "", destination = "")
    @origin = origin
    @destination = destination
  end

  def started?
    @origin != ""
  end

  def ended?
    @destination != ""
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end

  def complete?
    started? && ended?
  end
end
