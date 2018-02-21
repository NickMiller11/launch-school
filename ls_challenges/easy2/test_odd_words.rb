require 'minitest/autorun'

require_relative '01_odd_words'

class OddwordsTest < MiniTest::Test

  def test_sample_sentence
    test = Oddwords.new("whats the matter with kansas.")
    expected = "whats eht matter htiw kansas."
    assert_equal(expected, test.convert)
  end
end