require_relative 'polytree'

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


  attr_reader :starting_position

  def initialize(position)
    @starting_position = position
    @considered_positions = [starting_position]
    self.build_move_tree
  end

  def path_find(position)
    # search for the end pos recursively using dfs

  end

  def new_move_positions(new_pos)
    KnightPathFinder.valid_moves(new_pos)

    return @considered_positions
  end

  # build a move tree
  # root node of the tree should be knight's starting position

  # values in trees will be the positions
  # a node is a child of another node if you can move from the parent
  # position directly to the child position

  def build_move_tree
    # start with self.root_node
    @root_node = PolyTreeNode.new(position)
  end

end

p KnightPathFinder.valid_moves([0, 0])
# kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]