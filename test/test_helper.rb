$:.unshift File.join(File.dirname(__FILE__), "../lib")

module TestHelper
  def node(type)
    Logicle::Node.new(type)
  end

  def assert_node_state_for_inputs(value, target_node, *inputs)
    target_node.clear_inputs
    target_node.append_inputs(*inputs)
    assert_equal(value, target_node.state)
  end

end
