require_relative "test_helper"

require "test/unit"


class DigraphTest < Test::Unit::TestCase
  include TestHelper

  def test_add_node
    start_node_count = digraph.instance_variable_get(:@nodes).count
    digraph.add_node(1, :and)
    assert_equal(start_node_count + 1, 
                 digraph.instance_variable_get(:@nodes).count)
  end

  def test_add_edge
    start_edge_count = digraph.instance_variable_get(:@edges).count
    digraph.add_node(1, :and)
    digraph.add_node(2, :or)
    digraph.add_edge(1, 2)
    assert_equal(start_edge_count + 1,
                 digraph.instance_variable_get(:@edges).count)

    nodes = digraph.instance_variable_get(:@nodes) 
    assert(nodes[2].inputs.include?(nodes[1]))
  end

  def test_add_edge_with_unknown_node
    assert_raises(Logicle::UnknownNodeError) do
      digraph.add_node(1, :and)
      digraph.add_edge(1, 2)
    end
  end
end
