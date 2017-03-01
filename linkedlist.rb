class LinkedList
	attr_accessor :head
	def append(value)
		newnode = Node.new
		newnode.value(value)
		if @head == nil
			@head = newnode
		else
			pointer = @head
			pointer = pointer.next_node until pointer.next_node == nil
			pointer.next(newnode)	
		end
	end

	def prepend(value)
		newnode = Node.new
		newnode.value(value)
		if @head == nil
			@head = newnode
		else
			newnode.next(@head)
			@head = newnode
		end
	end


	def size
		counter = 1
		if @head == nil
			return 0
		else
			pointer = @head
			until pointer.next_node == nil
				counter += 1
				pointer = pointer.next_node
			end
		end
		counter
	end

	def tail
		if @head == nil
			nil
		else
			pointer = @head
			pointer = pointer.next_node until pointer.next_node == nil
			pointer
		end
	end
	

	def at(index)
		if index == 0
			@head
		else
			pointer = @head
			index.times {pointer = pointer.next_node}
			pointer
		end
	end

	def pop
		if @head.next_node == nil
			@head = nil
		else
			pointer = @head
			pointer = pointer.next_node until pointer.next_node.next_node == nil
			pointer.next(nil)
		end
	end
	def contains?(value)
		doesit = false
		pointer = @head
		until pointer == nil
			doesit = true if pointer.checkval == value
			pointer = pointer.next_node
		end
		doesit
	end

	def find(data)
		if self.contains?(data) == false
			nil
		else
			counter = 0
			pointer = @head
			until pointer.checkval == data
				counter += 1
				pointer = pointer.next_node
			end
			counter
		end
	end

	def to_s
		string = ""
		pointer = @head
		until pointer == nil
			string = string + "( #{pointer.checkval} ) -> "
			pointer = pointer.next_node
		end
		string = string + "nil"
		string
	end

	def insert_at(index, value)
		newnode = Node.new
		newnode.value = value
		pointer = self.at(index-1)
		newnode.next(pointer.next_node)
		pointer.next(newnode)
	end

	def remove_at(index)
		if index == 0
			pointer = @head
			@head = pointer.next_node
		else
		pointer = self.at(index-1)
		pointer.next(pointer.next_node.next_node)
		end
	end


end

class Node
	attr_accessor :value, :next_node
	def initialize
		@value = nil
		@next_node = nil
	end
	def value(int)
		@value = int
	end
	def checkval
		@value
	end

	def next(node)
		@next_node = node
	end
end