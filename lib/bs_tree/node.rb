class BsTree::Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    @leaf = true
    @value = value
  end

  def insert val
    unless @leaf == false
      if value < val then insert_right val
      elsif value > val then insert_left val
      else
        false
      end
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
      # binding.pry
      if right then right.insert(v)
      else
        self.right = self.class.new(v)
      end
    end
end
