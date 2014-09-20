require 'pry'
describe BsTree::Node do
  # all initialize
  before(:each) do 
    @root = BsTree::Node.new(5)
    @root.left = BsTree::Node.new(2)
    [1, 7, 3, 10, 8].each{|x| @root.insert x }
    # insert node with same value
    @root.insert(10)
  end
  
  # tree sketch
  #     5
  #   2    7
  # 1  3    10
  #        8
  # 

  it "should return the node value" do
    expect(@root.value).to eq 5
    expect(@root.left.value).to eq 2
  end

  it "should insert other nodes ASC with their value" do
    expect(@root.left.value).to eq 2
    expect(@root.left.left.value).to eq 1
    expect(@root.left.right.value).to eq 3
    expect(@root.right.value).to eq 7
    expect(@root.right.right.value).to eq 10
    expect(@root.right.right.left.value).to eq 8
  end

  it "should support DLR travel" do
    # same condition, the expectation will be the same
    described_class.travel(@root)
    # expect array exactly equal
    expect(described_class.travel(@root)).to eq([5, 2, 1, 3, 7, 10, 8])
  end   


  it "should support LRD travel" do
    expect(described_class.travel(:lrd, @root)).to eq([1, 3, 2, 8, 10, 7, 5]) 
  end

  it "should support LDR travel" do
    expect(described_class.travel(:ldr, @root)).to eq([1, 2, 3, 5, 7, 8, 10]) 
  end
  
  it "should support Level Order travel" do
    expect(described_class.travel(:level, @root)).to eq([5, 2, 7, 1, 3, 10, 8]) 
  end

end
