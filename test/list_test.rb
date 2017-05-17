# Sal drools Mike Rules
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/list'
require 'pry'

class ListTest < Minitest::Test
  def test_a_list_exists
    list = List.new

    assert_instance_of List, list
  end

  def test_list_starts_sans_head
    list = List.new

    assert_nil list.head
  end

  def test_we_can_push_one
    list = List.new

    list.push("Sal")

    assert_instance_of Node, list.head
    assert_equal "Sal", list.head.data
  end

  def test_we_can_push_two
    list = List.new

    list.push("Sal")
    list.push("Ali")

    assert_instance_of Node, list.head
    assert_equal "Sal", list.head.data
    assert_instance_of Node, list.head.next_node
    assert_equal "Ali", list.head.next_node.data
  end

  def test_we_can_push_three
    list = List.new

    list.push("Sal")
    list.push("Ali")
    list.push("Mike")

    assert_instance_of Node, list.head
    assert_equal "Sal", list.head.data
    assert_instance_of Node, list.head.next_node
    assert_equal "Ali", list.head.next_node.data
    assert_instance_of Node, list.head.next_node.next_node
    assert_equal "Mike", list.head.next_node.next_node.data
  end

  def test_it_can_count
    list = List.new

    assert_equal 0, list.count

    list.push("Sal")
    assert_equal 1, list.count

    list.push("Ali")
    assert_equal 2, list.count

    list.push("Mike")
    assert_equal 3, list.count
  end

  def test_it_can_delete_at_a_certain_index
    list = List.new
    list.push("Sal")
    list.push("Ali")
    list.push("Mike")
    list.push("Horace")
    list.push("Rachel")
    assert_equal 5, list.count

    expected = "Horace"
    actual   = list.delete_at(3)
    assert_equal expected, actual
    assert_equal 4, list.count
    expected_data = list.head.next_node.next_node.next_node.data
    assert_equal expected_data, "Rachel"
  end
end
