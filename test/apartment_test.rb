require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require './lib/apartment'
require './lib/renter'

class ApartmentTest < MiniTest::Test

  def test_it_has_a_renter
    renter1 = Renter.new("Jessie")
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})

    assert_equal "Jessie", renter1.name
    assert_equal "A1", unit1.unit[:number]
    assert_equal 1200, unit1.unit[:monthly_rent]
    assert_equal 1, unit1.unit[:bathrooms]
    assert_equal 1, unit1.unit[:bedrooms]
    assert_nil unit1.renter

    unit1.add_renter(renter1)
    assert_equal "Jessie", unit1.renter.name
  end





end
