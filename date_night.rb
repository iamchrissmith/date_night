require 'pry'
require './lib/node'

class BinarySearchTree
  attr_reader :root
  def initialize
    @root = nil
  end

  def validate_score(score)
    # binding.pry
    if score > 100 || score < 0
      return false
    elsif include?(score)
      return false
    else
      return true
    end
  end

  def place_node_in_tree(node, previous = @root, depth = 1)
    binding.pry
    if previous.score > node.score
      place_node_in_tree(node, previous.left_node, depth + 1) if previous.left_node
      previous.left_node = node
    else
      place_node_in_tree(node, previous.right_node, depth + 1) if previous.right_node
      # need a move node function if the .left_node is already set
      previous.right_node = node
    end
    depth
  end

  def include?(score)
    return false
  end

  def insert(score, title)
    return "Invalid Score" unless validate_score(score)
    depth = 0
    if !@root
      @root = Node.new(score, title)
    else
      depth = place_node_in_tree(Node.new(score,title))
    end
    depth
  end

end
