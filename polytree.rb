class PolyTreeNode

  attr_reader :value, :children, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent_node)
    unless self.parent.nil?
      self.parent.children.delete(self)
    end

    @parent = new_parent_node
    unless new_parent_node.nil?
      new_parent_node.children << self
    end
  end

    # is the node's parent the self.parent
    # passed_node is the a node isntance parent
    # should add the child node to the passed node's children

    # [] parent node (passed_node)
    #   \
    #     []  (child_node)

    # when reassigning
    # passed_node.children << node (self)
    # remove the node (self) from old parent's children
    # node should only have one parent
      # remove self from "old parent"

    # [ ____ , _____, ______, self ] old_parent.pop

  def add_child(child_node)
    # self == parent_node
    child_node.parent = self # child_node.parent=(self)
  end

  def remove_child(child_node)
    raise 'error' if child_node.parent.nil?
    child_node.parent = nil
  end

  def inspect
    {value: @value,
      children: @children.map { |child| child.value }
    }.inspect
  end

#Searchable
  def dfs(target_value)
    return self if self.value == target_value
    return nil if self.children.empty?

    self.children.each do |child|
      result = child.dfs(target_value)
      # if result.value == target_value
      #   return child
      # end
      unless result.nil?
        return result
      end
    end
    return nil
  end

  def bfs(target_value)
    arr = [self]
    until arr.empty?
      current_node = arr[0]
      if current_node.value == target_value
        return current_node
      end
      if !current_node.children.empty?
        arr.concat(current_node.children)
      end
      arr.shift
    end
    return nil
  end

end



