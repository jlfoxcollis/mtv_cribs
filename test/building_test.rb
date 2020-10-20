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
    assert_equal 1099.5, building.average_rent
  end

  def test_the_rent
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
    renter1 = Renter.new("Spencer")
    renter2 = Renter.new("Jessie")
    renter3 = Renter.new("Max")

    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)

    assert_equal [], building.rented_units

    unit2.add_renter(renter1)
    assert_equal "B2", building.rented_units[0].unit[:number]
    assert_equal 999, building.renter_with_highest_rent

    unit1.add_renter(renter2)
    assert_equal 1200, building.renter_with_highest_rent

    unit3.add_renter(renter3)
    assert_equal 1200, building.renter_with_highest_rent



    building.add_unit(unit4)
    assert_equal ["D4", "B2", "C3", "A1"], building.units_by_number_of_bedrooms.keys.map {|x| x[:number]}

  end

end
