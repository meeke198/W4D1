require_relative 'polytree'
require 'byebug'

# Learning Goals:
  # Implement your PolyTreeNode to build a path from start to finish
  # Know how to store and traverse a tree
  # Know when and why to use BFS vs. DFS

# create a class that will find the shortest path for a Chess Knight
# from starting position to an end position on 8 x 8 chess board

class KnightPathFinder
  POSITIONS = [[-2, 1],[-2, -1], [1, 2], [1, -2], [2, 1], [2, -1], [-1, -2], [-1, 2]]
  def self.valid_moves(pos)
    valid_moves = []
    POSITIONS.each do |pos_move|
      new_pos = [pos_move[0] + pos[0], pos_move[1] + pos[1]]
      if (new_pos[0] >= 0 && new_pos[0] < 8) && (new_pos[1] >= 0 && new_pos[1] < 8)
        valid_moves << new_pos
      end
    end
    valid_moves
  end

  attr_accessor :starting_position, :current_root_node

  def initialize(position)
    @starting_position = position
    @considered_positions = [@starting_position]
    self.build_move_tree
    @root_node = 
  end

  # we can use __.current_root_node.children[0] to see "moves" of first child
  def inspect
    { current_root_node: current_root_node }.inspect
  end

  def new_move_positions(new_pos)
    all_moves = KnightPathFinder.valid_moves(new_pos)
    # check to see if those moves have been in @considered_positions
    # filtered array must only contain "unique" moves
    new_moves = all_moves.reject { |move| @considered_positions.include?(move) }
    @considered_positions.concat(new_moves)
    return new_moves
  end

  # build a move tree
  # root node of the tree should be knight's starting position

  # values in trees will be the positions
  # a node is a child of another node if you can move from the parent
  # position directly to the child position

  def build_move_tree
    # start with new self.root_node
    # implement BFS using a queue to search nodes
    # incorporate new_move_positions
    self.current_root_node = PolyTreeNode.new(@starting_position)
    queue = [current_root_node]
    # need first first ele in queue
    # add current root node in queue

    until queue.empty?
      current_node = queue.shift

      new_move_positions(current_node.value).each do |pos|
        # debugger
        new_child = PolyTreeNode.new(pos)
        current_node.add_child(new_child)
        queue << new_child
      end
    end
    # does not need to return any values
    # has BFS behavior but does not search for a target
  end

  def find_path(end_pos)
    # search for the end pos recursively using dfs
    path = []
    return self if self.value == end_pos
    self.current_root_node.children.each do |child|
      result = child.dfs(end_pos)
      unless result.nil?
        path << result
      end
    end
    path.nil? nil : path
  end
def trace_path_back(end_pos)
  trace_path = []
  # start with a node add node.value to the arr
  # look to see if node has parent
  # if parent found, curent node == parent
  # add node.value to arr
  # continue until node doesnt has parent
  # arr.reverse it
end


end

k = KnightPathFinder.new([4, 4])
# p k.inspect

# kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]