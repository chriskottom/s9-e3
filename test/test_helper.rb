require_relative "../lib/logicle.rb"

module TestHelper
  def node(type)
    Logicle::Node.new(type)
  end

  def digraph
    @digraph ||= Logicle::Digraph.new
  end

  def assert_node_state_for_inputs(value, target_node, *inputs)
    target_node.clear_inputs
    target_node.append_inputs(*inputs)
    assert_equal(value, target_node.state)
  end

  def tgf_reader(input=tgf_content)
    @tgf_reader ||= Logicle::TgfReader.new(input)
  end

  def tgf_content
    @tgf_content ||= <<-TGF.gsub(/^\s+/, "")
      1 NOT
      2 AND
      3 OR
      4 SWITCH
      5 SWITCH
      6 SWITCH
      7 BULB
      #
      4 1
      5 2
      6 2
      2 3
      1 3
      3 7
      TGF
  end
end
