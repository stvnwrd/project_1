require 'minitest/autorun'
require_relative '../models/artist'

class TestArtist < MiniTest::Test

  def setup
    @artist = Artist.new({"name" => "Right Said Fred"})
  end

  def test_get_name
    assert_equal("Right Said Fred", @artist.name())
  end



end
