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
    # if parent isn't nil
    # remove "self" from parent's children array
    # (for reassignment)
    if !@parent.nil? && !elder.nil?
      @parent.remove_child(self)
    end
    
    # setting our parent equal to elder
    @parent = elder        
    
    # adding ourselves to elder's children array
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
    # debugger
    @children << kid unless @children.include?(kid)

    kid.parent = self 
  end
  
  # def dfs(target_value)
  #   return self if target_value == value
  #   # return self if children.empty?
  #   # debugger
  #   children.each do |child|
  #     child.dfs(target_value)
  #   end
  # 
  # end
  # 
  # def bfs(target_value)
  #   return self if target_value == value
  #   return self if queue.empty?
  #   queue = Array.new
  #   children.each do |child|
  #     queue.push(child)
  #   end
  # 
  #   queue.shift.bfs(target_value)
  # end
end



