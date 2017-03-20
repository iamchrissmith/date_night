require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './date_night.rb'

class DateNightTest < MiniTest::Test
  def test_node_exists
    node = Node.new(1, 'Test')
    assert node
  end
  def test_node_stores_score_title
    node = Node.new(1, 'Test')
    assert_equal 1, node.score
    assert_equal "Test", node.title
  end

  def test_binary_tree_exists
    tree = BinarySearchTree.new
    assert tree
  end
  def test_score_cannot_be_greater_than_100
    tree = BinarySearchTree.new
    assert_equal "Invalid Score", tree.insert(101, "Bad Score")
  end
  def test_score_cannot_be_less_than_0
    tree = BinarySearchTree.new
    assert_equal "Invalid Score", tree.insert(-1, "Bad Score")
  end
  def test_scores_cannot_be_the_same
    skip
    tree = BinarySearchTree.new
    tree.insert(10, "First Ten")
    assert_equal "Invalid Score", tree.insert(10, "Hang Ten")
  end
  def test_first_node_set_as_root
    tree = BinarySearchTree.new
    tree.insert(10, "First Ten")
    assert_equal 10, tree.root.score
    assert_equal "First Ten", tree.root.title
  end
  def test_insert_returns_correct_depth
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(10, "First Depth")
    assert_equal 1, tree.insert(11, "Second Depth")
    assert_equal 1, tree.insert(9, "Third Depth")
    assert_equal 2, tree.insert(8, "Fourth Depth")
    assert_equal 2, tree.insert(12, "Fifth Depth")
  end
  def test_nodes_applied_correctly_to_tree
    skip
    tree = BinarySearchTree.new
    tree.insert(10, "First Ten")
    tree.insert(11, "Second Movie")
    tree.insert(9, "Third Movie")
    tree.insert(8, "Fourth Movie")
    tree.insert(12, "Fifth Movie")
    assert_equal 10, tree.root.score
    assert_equal 11, tree.root.right_node.score
    assert_equal 12, tree.root.right_node.right_node.score
    assert_equal 9, tree.root.left_node.score
    assert_equal 8, tree.root.left_node.left_node.score

  end
end

# Scores are integers between 0 and 100
# No two movies can have the same score

# Insert
=begin
returns the depth of the new node in the tree
tree.insert(61, "Bill & Ted's Excellent Adventure")
# => 0
tree.insert(16, "Johnny English")
# => 1
tree.insert(92, "Sharknado 3")
# => 1
tree.insert(50, "Hannibal Buress: Animal Furnace")
# => 2
=end

# Include?
=begin
verify or reject the presence of a score in the tree
tree.include?(16)
# => true
tree.include?(72)
# => false
=end

# Depth_of
=begin
Reports the depth of the tree where a score appears.
Return nil if the score does not exist:

tree.depth_of(92)
# => 1
tree.depth_of(50)
# => 2
=end

# Max
=begin
Which movie has the highest score in the list? What is it’s score?

tree.max
# => {"Sharknado 3"=>92}
=end

# min
=begin
Which movie has the lowest score in the list? What is it’s score?

tree.min
# => {"Johnny English"=>16}
=end

# sort
=begin
Return an array of all the movies and scores in sorted ascending order.
Return them as an array of hashes.
Note: you’re not using Ruby’s Array#sort.
You’re traversing the tree.

tree.sort
# => [{"Johnny English"=>16},
#   {"Hannibal Buress: Animal Furnace"=>50},
#   {"Bill & Ted's Excellent Adventure"=>61},
#  {"Sharknado 3"=>92}]
=end

# load
=begin
Assuming we have a file named movies.txt with one score/movie pair per line:

# movies.txt sample format:
34, Hannibal Buress: Comedy Camisado
63, Meet My Valentine
22, Experimenter
84, French Dirty
41, Love
10, I Love You Phillip Morris
tree.load('movies.txt')
# => 26
Where the return value is the number of movies inserted into the tree.
If a score is already present in the tree when load is called, ignore it.
=end

# health
=begin
Report on the health of the tree by summarizing the number of child nodes
(nodes beneath each node) at a given depth.
For health, we’re worried about 3 values:

Score of the node
Total number of child nodes including the current node
Percentage of all the nodes that are this node or it’s children
tree.insert(98, "Animals United")
tree.insert(58, "Armageddon")
tree.insert(36, "Bill & Ted's Bogus Journey")
tree.insert(93, "Bill & Ted's Excellent Adventure")
tree.insert(86, "Charlie's Angels")
tree.insert(38, "Charlie's Country")
tree.insert(69, "Collateral Damage")
tree.health(0)
=> [[98, 7, 100]]
tree.health(1)
=> [[58, 6, 85]]
tree.health(2)
=> [[36, 2, 28], [93, 3, 42]]
Where the return value is an Array with one nested array per node at that
level. The nested array is:

[
    score in the node,
    1 + number of child nodes,
    floored percentage of (1+children) over the total number of nodes
]
When the percentages of two nodes at the same level are dramatically
different, like 28 and 42 above, then we know that this tree is
starting to become unbalanced.
=end
