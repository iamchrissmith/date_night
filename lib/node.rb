# Each node has:
# - An element of data
# - A link to the LEFT (value is less or lower than this node's data element)
# - A link to the RIGHT (value is more or greater than the node's data element)
class Node
  attr_reader :title, :score
  attr_accessor :left_node, :right_node
  def initialize(score, title)
    @score      = score
    @title      = title
    @left_node  = nil
    @right_node = nil
  end
end
