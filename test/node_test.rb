require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_it_exists
    node = Node.new("Mike")

    assert_instance_of Node, node
  end

  def test_it_holds_data_and_next_is_empty_by_default
    node = Node.new("Mike")

    assert_equal "Mike", node.data
    assert_nil node.next_node
  end

  def test_it_holds_other_data
    node = Node.new("Sal")

    assert_equal "Sal", node.data
    assert_nil node.next_node
  end

  def test_next_node_can_be_changed
    node = Node.new("Sal")

    assert_nil node.next_node

    node.next_node = Node.new("Ali")

    assert_instance_of Node, node.next_node
  end
end
