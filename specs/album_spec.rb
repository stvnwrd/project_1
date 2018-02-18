require 'minitest/autorun'
require_relative '../models/album'


class TestAlbum < Minitest::Test

  def setup
    @album = Album.new({"title" => "Take That and Party", "stock_level" => "5"})
  end

  def test_get_album_title
    assert_equal("Take That and Party", @album.title)
  end

  def test_get_stock_level
    assert_equal(5, @album.stock_level)
  end

  # def test_change_stock_level
  #
  #   assert_equal(4, @album.stock_level)
  # end

end
