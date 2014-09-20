class BsTree::Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    @value = value
  end

  def insert val  
    if value < val then insert_right val
    elsif value > val then insert_left val
    else
      false
    end
  end

  def self.travel(type=:dlr, root)
    if root.nil? then raise "no root"
    else
      @@sequnce = []
      if respond_to?("#{type}".to_sym) then send("#{type}".to_sym, root)
      else
        raise "#{type} kind of travel does not exist"
      end
      @@sequnce
    end
  end

  private
    def insert_left(v) 
      if left then left.insert(v)
      else 
        self.left = self.class.new(v)
      end
    end

    def insert_right(v)
      if right then right.insert(v)
      else
        self.right = self.class.new(v)
      end
    end

    #DLR travel 
    def self.dlr root
      @@sequnce << root.value
      send(:dlr, root.left) if root.left
      send(:dlr, root.right) if root.right
    end

    #LRD travel 
    def self.lrd root
      send(:lrd, root.left) if root.left    
      send(:lrd, root.right) if root.right
      @@sequnce << root.value
    end

    #LDR travel
    def self.ldr root
      send(:ldr, root.left) if root.left    
      @@sequnce << root.value
      send(:ldr, root.right) if root.right
    end

    #level travel 
    def self.level root
      slice = [] << root
      while !slice.empty?
        node = slice.shift
        @@sequnce << node.value
        # under level travel, left and right node has no difference 
        slice << node.left if node.left
        slice << node.right if node.right
      end
    end
end
