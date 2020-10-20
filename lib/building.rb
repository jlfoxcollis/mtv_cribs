class Building
  attr_reader :units, :renters

  def initialize(units = [])
    @units = []
    @renters = []
    @rent = 1099.5
  end

  def add_unit(unit)
    @units << unit
  end

  def add_renter(renter)
    @renters << renter
  end

  def averate_rent
    @rent
  end

end
