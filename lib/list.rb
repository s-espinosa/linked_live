require "./lib/node"

class List
  attr_reader :head, :count

  def initialize
    @head = nil
    @count = 0
  end

  def push(data)
    @count += 1
    if @head.nil?
      @head = Node.new(data)
    else
      push_recursively(data)
    end
  end

  def push_recursively(data, current_node = @head)
    if current_node.next_node.nil?
      current_node.next_node = Node.new(data)
    else
      push_recursively(data, current_node.next_node)
    end
  end

  def delete_at(pos)
    current_node = @head
    (pos - 1).times do
      current_node = current_node.next_node
    end

    data = current_node.next_node.data
    current_node.next_node = current_node.next_node.next_node

    @count -= 1
    return data
  end

end
