# Node class stores the data and the location of the next node
class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    # this points to the next node
    @next = nil
  end
end

# linked list class stores the nodes in a list
class LinkedList
  attr_accessor :head, :size, :prev_node

  def initialize(value)
    @head = Node.new(value)
    # might have to implement this var in prepend?
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
    nex = @head.next
    until nex.nil?
      current = nex
      nex = current.next
    end
    current.value
  end

  # returns the node at the given index
  def at(index)
    current = @head
    nex = @head.next
    # how to return when you want the first item
    index.times do
      current = nex
      nex = current.next
    end
    current.value
  end

  # return the last item of the list
  def pop
    # the second last node can no longer point to anything
    # remove the value of the last node
    # have a size variable i can play with
    current = @head
    nex = @head.next
    (@size - 1).times do
      current = nex
      nex = current.next
    end
    current
  end

  def contains?(num)
    current = @head
    nex = @head.next
    (@size - 1).times do
      return true if current.value == num

      current = nex
      nex = current.next
    end
    false
  end

  # returns the index of the node containing value, or nil if not found
  def find(num)
    index = 0
    current = @head
    nex = @head.next
    @size.times do
      return index if current.value == num
      return nil if current.next.nil?

      current = nex
      nex = current.next
      index += 1
    end
  end

  # have to remove frozen string literal comment for this to work
  def to_string
    node_string = ''
    current = @head
    nex = @head.next
    @size.times do
      node_string.concat(" (#{current.value}) ->")
      if current.next.nil?
        node_string.concat(' nil ')
        return node_string
      end
      current = nex
      nex = current.next
    end
  end
end

arr = [1, 2, 3, 4]

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
  prepend_list = prepend_list(arr)
  append_list = append_list(arr)

  puts "\nLinked list made with prepend: "
  p prepend_list
  puts "\nLinked list made with append: "
  p append_list

  puts "\nconvert the list values to one string"
  p prepend_list.to_string
  p append_list.to_string

  puts "\nindex at 1: "
  p prepend_list.at(1)
  p append_list.at(1)

  puts "\nshow the last element: "
  p prepend_list.pop
  p append_list.pop

  puts "\ndoes prepend_list contain 2?"
  p prepend_list.contains?(2)
  puts "\ndoes append_list contain 6?"
  p append_list.contains?(6)

  puts "\nreturn the index where the value is 4"
  p prepend_list.find(4)
  puts "\nreturn the index where the value is 6"
  p append_list.find(6)
end

display(arr)
