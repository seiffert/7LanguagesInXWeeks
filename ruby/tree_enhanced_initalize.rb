class Tree
  attr_accessor :children, :name, :parent
  
  def initialize(structure, parent=nil)
    if structure.length > 1
      raise "A tree cannot have multiple root nodes."
    end
    
    @parent = parent
    
    @children = []
    structure.keys.each do |key|
      @name = key
      structure[key].keys.each do |child_name|
        @children.push(Tree.new({child_name => structure[key][child_name]}, self))
      end
    end
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

tree = Tree.new({"Wurzel" => {"Ast" => {}, "Zweig" => {}}})

printer = TreePrinter.new
printer.print(tree)

tree = Tree.new({"grandpa" => { "dad" => {"child 1" => {}, "child 2" => {} }, "uncle" => {"child 3" => {}, "child 4" => {} } } })
printer.print(tree)