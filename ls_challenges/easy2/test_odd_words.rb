require 'minitest/autorun'

require_relative '01_odd_words'

class OddwordsTest < MiniTest::Test

  def test_sample_sentence
    test = Oddwords.new("whats the matter with kansas.")
    expected = "whats eht matter htiw kansas."
    assert_equal(expected, test.convert)
  end

  def test_sample_sentence_last_word_odd_index
    test = Oddwords.new("whats the matter now with kansas.")
    expected = "whats eht matter won with sasnak."
    assert_equal(expected, test.convert)
  end

  def test_one_word
    test = Oddwords.new("help.")
    expected = "help."
    assert_equal(expected, test.convert)
  end

  def test_twenty_words
    string = "I got a light like that myself she shines she shines \
              like no one else I'm going in and out."
    test = Oddwords.new(string)
    expected = "I tog a thgil like taht myself ehs shines ehs shines \
ekil no eno else m'I going ni and tuo."
    assert_equal(expected, test.convert)
  end

  def test_multiple_spaces_in_sentence
    test = Oddwords.new("whats      the  matter       now with   kansas.")
    expected = "whats eht matter won with sasnak."
    assert_equal(expected, test.convert)
  end

  def test_multiple_spaces_at_end_of_sentence
    test = Oddwords.new("whats the matter now with kansas      .")
    expected = "whats eht matter won with sasnak."
    assert_equal(expected, test.convert)
  end
end