class BsTree::Tree
	$dlr_seq, $lrd_seq = [], []

	#DLR traval 
	def self.dlr_traval tree
	 	$dlr_seq << tree.value
	  send(:dlr_traval, tree.left) if tree.left
	  send(:dlr_traval, tree.right) if tree.right
	end

	#LRD traval 
	def self.lrd_traval tree
	  send(:lrd_traval, tree.left) if tree.left    
	  send(:lrd_traval, tree.right) if tree.right
	  $lrd_seq << tree.value
	end
end