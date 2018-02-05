require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy Milk")
    @todo2 = Todo.new("Clean Room")
    @todo3 = Todo.new("Go to Gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_raise_typeerror
    assert_raises(TypeError) { @list.add("hi") }
    assert_raises(TypeError) { @list.add(1) }
  end

  def test_shovel
    todo4 = Todo.new("Test")
    @list << todo4
    @todos << todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    todo4 = Todo.new("Test")
    @list.add(todo4)
    @todos << todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(4) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(4) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(2)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy Milk
    [ ] Clean Room
    [ ] Go to Gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    @todo1.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy Milk
    [ ] Clean Room
    [ ] Go to Gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy Milk
    [X] Clean Room
    [X] Go to Gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    @list.each { |todo| todo.title.upcase! }
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [ ] BUY MILK
      [ ] CLEAN ROOM
      [ ] GO TO GYM
      OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each_returns_original_list
    assert_equal(@list, @list.each {|todo| nil })
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end

  def test_find_by_title
    output = @list.find_by_title("Buy Milk")
    assert_equal(@todo1, output)
  end

  def all_done
    assert_equal(false, @list.all_done)
    @todo1.done!
    @todo2.done!
    @todo3.done!
    assert_equal(true, @list.all_done)
  end

  def all_not_done
    assert_equal(true, @list.all_not_done)
    @todo1.done!
    @todo2.done!
    @todo3.done!
    assert_equal(false, @list.all_not_done)
  end
end
