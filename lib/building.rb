class Building
  attr_reader :units, :renters, :rent, :rented_units

  def initialize(units = [])
    @units = []
    @renters = []
    @rent = rent
    @rented_units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def add_renter(renter)
    @renters << renter
  end

  def rented_units
    @units.select {|unit| unit.renter != nil}
  end

  def average_rent
    rent = units.map {|unit| unit.unit[:monthly_rent]}
    average = (rent.sum.to_f / rent.count.to_f).round(1)
  end

  def renter_with_highest_rent
    rent = rented_units.map {|unit| unit.unit[:monthly_rent]}
    rent.max
  end

  def units_by_number_of_bedrooms
    sorted = @units.sort {|a, b| b.unit[:bedrooms] <=> a.unit[:bedrooms]}
    all_bedrooms = Hash.new { |hash_object, key| hash_object[key] = [] }
    sorted.each do |unit|
      all_bedrooms[unit.unit] << unit
    end
    all_bedrooms
  end

  def annual_breakdown
    breakdown = Hash.new { |hash_object, key| hash_object[key] = nil }
    rented_units.each do |unit|
      breakdown[unit.renter.name] = (unit.unit[:monthly_rent] * 12)
    end
    breakdown
  end

  def rooms_by_renter
    by_renter = Hash.new { |hash_object, key| hash_object[key] = {} }
    rented_units.each do |unit|
      by_renter[unit.renter] = ({unit.unit.keys[2] => unit.unit.values[2], unit.unit.keys[3] => unit.unit.values[3]})
    end
    by_renter
  end


end
