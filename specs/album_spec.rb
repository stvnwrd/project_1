require 'minitest/autorun'
require_relative '../models/album'


class TestAlbum < Minitest::Test

  def setup
    @album = Album.new({"title" => "Take That and Party", "artist_id" => 4, "stock_level" => "5"})
  end

  def test_get_album_title
    assert_equal("Take That and Party", @album.title)
  end

  def test_get_artist_id
    assert_equal(4, @album.artist_id)
  end

  def test_get_stock_level
    assert_equal(5, @album.stock_level)
  end


  def test_crude_stock_level__in_stock
    assert_equal("In Stock", @album.crude_stock_status)
  end

  def test_crude_stock_level__low_stock
    result = Album.new({"title" => "Take That and Party", "stock_level" => "2"})
    assert_equal("Low Stock - Re-Order Now", result.crude_stock_status)
  end

  def test_crude_stock_level__one_left
    result = Album.new({"title" => "Take That and Party", "stock_level" => "1"})
    assert_equal("Only 1 left!!!", result.crude_stock_status)
  end

  def test_crude_stock_level__out_of_stock
    result = Album.new({"title" => "Take That and Party", "stock_level" => "0"})
    assert_equal("Out of Stock", result.crude_stock_status)
  end

  def test_crude_stock_level__out_of_stock_negative
    result = Album.new({"title" => "Take That and Party", "stock_level" => "-2"})
    assert_equal("Out of Stock", result.crude_stock_status)
  end

end
