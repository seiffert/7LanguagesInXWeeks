class Tree
  attr_accessor :children, :name, :parent
  
  def initialize(name, children=[])
    children.each {|child| child.parent = self}
    
    @children = children
    @name = name
  end
  
  def visit_all(&block)
    visit &block
    @children.each {|child| child.visit_all(&block)}
  end
  
  def visit(&block)
    block.call self
  end
end

class TreePrinter
  def print(tree)
    tree.visit_all { |node| self.print_node(node) }
  end
  
  def print_node(node)
    outLine = " " * (indent(node) * 2)
    outLine << node.name
    puts outLine
  end
  
  def indent(node)
    if node.parent.nil?
      0
    else
      2 + indent(node.parent)
    end
  end
end

tree = Tree.new("Wurzel", [Tree.new("Ast"), Tree.new("Zweig")])

printer = TreePrinter.new
printer.print(tree)
