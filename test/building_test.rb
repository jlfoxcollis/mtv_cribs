require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require './lib/apartment'
require './lib/renter'
require './lib/building'

class BuildingTest < MiniTest::Test

  def test_it_has_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    renter1 = Renter.new("Aurora")
    renter2 = Renter.new("Tim")
    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal ["A1", "B2"], building.units.map {|unit| unit.unit[:number]}
    assert_equal [], building.renters

    building.add_renter(renter1)
    assert_equal ["Aurora"], building.renters.map {|renter| renter.name}
    building.add_renter(renter2)
    assert_equal ["Aurora", "Tim"], building.renters.map {|renter| renter.name}
    assert_equal 1099.5, building.averate_rent
  end

end
