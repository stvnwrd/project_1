require 'minitest/autorun'
require_relative '../models/artist'

class TestArtist < MiniTest::Test

  def setup
    @artist = Artist.new({"id" => 2, "name" => "Right Said Fred"})
  end

  def test_get_name
    assert_equal("Right Said Fred", @artist.name())
  end

  def test_get_id
    assert_equal(2, @artist.id())
  end


end
