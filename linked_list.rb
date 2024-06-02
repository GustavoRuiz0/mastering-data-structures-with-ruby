class LinkedList
  attr_accessor :head, :tail, :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def insert(data)
    node = Node.new(data)
    unless head
      self.head = node
    else
      self.tail.next = node
    end
    self.tail = node
    self.length += 1
  end

  def remove(node)
    return nil unless node

    if node == head
      if head.next.nil?
        self.head = self.tail = nil
      else
        self.head = self.head.next
      end
    else
      tmp = self.head
      while tmp && tmp.next != node
        tmp = tmp.next
      end
      tmp.next = node.next if tmp
    end
    self.length -= 1
  end

  def cat(list)
    return nil unless list
    self.tail.next = list.head
    self.tail = list.tail if list.tail
    self.length += list.length
  end

  def clear
    while self.length > 0
      remove(self.head)
    end
  end

  def find_first(&predicate)
    return nil unless block_given?

    current = self.head
    while current
      return current if predicate.call(current)
      current = current.next
    end
    nil
  end

  def print
    if self.length == 0
      puts "EMPTY"
    else
      current = self.head
      while current
        puts current.data
        current = current.next
      end
    end
  end
end

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

list = LinkedList.new

list.insert(1)
list.insert(2)
list.insert(3)
list.print
