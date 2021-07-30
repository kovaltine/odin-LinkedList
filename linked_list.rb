# frozen_string_literal: true

# Node class stores the data and the location of the next node
class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

# linked list class stores the nodes in a list
class LinkedList
  attr_accessor :head, :size, :prev_node

  def initialize(value)
    @head = Node.new(value)
    @prev_node = @head
    @size = 1
  end

  # new node at the end
  def append(num)
    new_node = Node.new(num)
    @prev_node.next = new_node
    @prev_node = new_node

    @size += 1
  end

  # add the new node to the start
  def prepend(num)
    new_node = Node.new(num)
    new_node.next = @head
    @head = new_node
    @size += 1
  end

  # returns the last node in the list
  def tail
    current = @head
    adjacent = @head.next
    until adjacent.nil?
      current = adjacent
      adjacent = current.next
    end
    current.value
  end

  # returns the node at the given index
  def at(index)
    current = @head
    adjacent = @head.next
    index.times do
      current = adjacent
      adjacent = current.next
    end
    current.value
  end

  # return the last item of the list
  def pop
    current = @head
    adjacent = @head.next
    (@size - 1).times do
      current = adjacent
      adjacent = current.next
    end
    current
  end

  def contains?(num)
    current = @head
    adjacent = @head.next
    @size.times do
      return true if current.value == num

      return false if current.next.nil?

      current = adjacent
      adjacent = current.next
    end
  end

  # returns the index of the node containing value, or nil if not found
  def find(num)
    index = 0
    current = @head
    adjacent = @head.next
    @size.times do
      return index if current.value == num
      return nil if current.next.nil?

      current = adjacent
      adjacent = current.next
      index += 1
    end
  end

  # convert the list values to one string
  def to_string
    node_string = []
    current = @head
    adjacent = @head.next
    @size.times do
      node_string << " (#{current.value}) ->"
      if current.next.nil?
        node_string << ' nil '
        return node_string.join
      end
      current = adjacent
      adjacent = current.next
    end
  end
end

# two different ways to build the list

# adds nodes to the end of the list
def append_list(arr)
  index = 0
  list = LinkedList.new(arr[index])
  while index < (arr.length - 1)
    index += 1
    list.append(arr[index])
  end
  list
end

# adding nodes to the start of the list
def prepend_list(arr)
  index = 0
  list = LinkedList.new(arr[index])
  while index < (arr.length - 1)
    index += 1
    list.prepend(arr[index])
  end
  list
end

# displays the methods applied to the linked lists
def display(arr)
  puts "\n #{arr}"

  prepend_list = prepend_list(arr)
  append_list = append_list(arr)

  puts "\nLinked list made with prepend: "
  p prepend_list
  puts "\nLinked list made with append: "
  p append_list

  puts "\nconvert the list values to one string"
  puts prepend_list.to_string
  puts append_list.to_string

  puts "\nindex at 1: "
  p prepend_list.at(1)
  p append_list.at(1)

  puts "\nshow the last element: "
  p prepend_list.pop
  p append_list.pop

  puts "\ndoes prepend_list contain 'I'?"
  p prepend_list.contains?('I')
  puts "\ndoes append_list contain 6?"
  p append_list.contains?(6)

  puts "\nreturn the index where the value is 4"
  p prepend_list.find(4)
  puts "\nreturn the index where the value is 6"
  p append_list.find(6)
end

string_arr = %w[I am a linked list]

arr = [1, 2, 3, 4]

display(arr)
display(string_arr)
