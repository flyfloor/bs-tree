class BsTree::Tree

  def self.traval(type=:dlr, tree)
    @@sequnce = []
    if respond_to?("#{type}".to_sym) then send("#{type}".to_sym, tree)
    else
      raise "#{type} kind of traval does not exist"
    end
  end

  def self.sequnce
    @@sequnce
  end


  private
    #DLR traval 
    def self.dlr tree
      @@sequnce << tree.value
      send(:dlr, tree.left) if tree.left
      send(:dlr, tree.right) if tree.right
    end

    #LRD traval 
    def self.lrd tree
      send(:lrd, tree.left) if tree.left    
      send(:lrd, tree.right) if tree.right
      @@sequnce << tree.value
    end

end