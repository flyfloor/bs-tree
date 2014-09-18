# BsTree

An implementation of binary tree, just 4 fun :)

## Installation

Add this line to your application's Gemfile:

    gem 'bs_tree'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bs_tree

## Usage

tree root element:  

		@root = BsTree::Node.new(5)

and add node:
	
		@root.insert(10)

or
	
		[1, 7, 3, 10, 8].each{|x| @root.insert x }

># 	  5
#   2	   7
# 1  3 	 	10
# 			 8

DLR traval:

	BsTree::Tree.dlr_traval(@root)

LRD traval:

	BsTree::Tree.lrd_traval(@root)

## Contributing

1. Fork it ( http://github.com/<my-github-username>/bs_tree/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
