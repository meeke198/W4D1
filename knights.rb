require_relative 'polytree'

# Learning Goals:
  # Implement your PolyTreeNode to build a path from start to finish
  # Know how to store and traverse a tree
  # Know when and why to use BFS vs. DFS

# create a class that will find the shortest path for a Chess Knight
# from starting position to an end position on 8 x 8 chess board

class KnightPathFinder
  def self.valid_moves(pos, visited = Set.new())

    while possible.moves.length <= 8
    # 8 possible moves
      return nil if visited.include?(pos)

      @considered_positions << pos
      visited.add(pos)
    end

  end

  attr_reader :starting_position

  def initialize(position)
    @root_node = PolyTreeNode.new(position)
    @considered_positions = [@root_node.value]
    self.build_move_tree
  end

  def path_find(position)


  end

  def new_move_positions(new_pos)
    KnightPathFinder.valid_moves()

    return @considered_positions
  end

  # build a move tree
  # root node of the tree should be knight's starting position

  # values in trees will be the positions
  # a node is a child of another node if you can move from the parent
  # position directly to the child position

  def build_move_tree
    # start with self.root_node

  end

end

# kpf = KnightPathFinder.new[0, 0]
# kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]