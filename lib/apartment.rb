class Apartment
  attr_reader :unit, :renter

  def initialize(unit)
    @unit = unit
    @renter = nil
  end

  def add_renter(renter)
    @renter = renter
  end

end
