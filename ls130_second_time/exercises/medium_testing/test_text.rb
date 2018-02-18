require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < MiniTest::Test

  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  def test_swap
    text_test = Text.new(@file.read)
    actual = text_test.swap("a", "e")
    expected = <<~OUTPUT
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    OUTPUT

    assert_equal(expected, actual)
  end

  def test_word_count
    text_test = Text.new(@file.read)
    assert_equal(72, text_test.word_count)
  end

  def teardown
    @file.close
  end

end
