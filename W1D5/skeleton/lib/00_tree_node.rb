require 'byebug'

class PolyTreeNode
  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end
  
  attr_reader :value, :parent, :children

  def parent=(elder=nil)
    return if elder == self

    if !@parent.nil? && !elder.nil?
      @parent.remove_child(self)
    end
    
    @parent = elder        
    
    @parent.children << self unless @parent.nil? || @parent.children.include?(self) 
  end
  
  
  def remove_child(kid)
    if !@children.include?(kid)
      raise "That's not your kid!"
    end
    
    @children.delete(kid)
    kid.parent = nil
  end
  
  def add_child(kid)

    @children << kid unless @children.include?(kid)

    kid.parent = self 
  end
  
  def dfs(target_value)
    return self if target_value == value
    
    children.each do |child|
      good_kid = child.dfs(target_value)
      return good_kid if good_kid
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      first = queue.shift
      return first if first.value == target_value
      first.children.each do |child|
        queue.push(child)
      end
    end
    nil
  end
end
