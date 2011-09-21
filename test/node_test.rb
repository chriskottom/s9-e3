require_relative "test_helper"

require "logicle"
require "test/unit"


class NodeTest < Test::Unit::TestCase
  def node(type)
    Logicle::Node.new(type)
  end

  def assert_value_with_inputs(value, target_node, *inputs)
    target_node.clear_inputs
    target_node.append_inputs(*inputs)
    assert_equal(value, target_node.state)
  end


  def test_on_node
    assert_equal(true, node(:on).state)
  end

  def test_off_node
    assert_equal(false, node(:off).state)
  end

  def test_not_node
    not_node = node(:not)
    on_node = node(:on)
    off_node = node(:off)

    assert_value_with_inputs(false, not_node, on_node)
    assert_value_with_inputs(true, not_node, off_node)
  end

  def test_and_node
    and_node = node(:and)
    on_node = node(:on)
    off_node = node(:off)

    assert_value_with_inputs(true, and_node, on_node, on_node)
    assert_value_with_inputs(false, and_node, on_node, off_node)
    assert_value_with_inputs(false, and_node, off_node, on_node)
    assert_value_with_inputs(false, and_node, off_node, off_node)
  end

  def test_or_node
    or_node = node(:or)
    on_node = node(:on)
    off_node = node(:off)

    assert_value_with_inputs(true, or_node, on_node, on_node)
    assert_value_with_inputs(true, or_node, on_node, off_node)
    assert_value_with_inputs(true, or_node, off_node, on_node)
    assert_value_with_inputs(false, or_node, off_node, off_node)
  end

  def test_nand_node
    nand_node = node(:nand)
    on_node = node(:on)
    off_node = node(:off)

    assert_value_with_inputs(false, nand_node, on_node, on_node)
    assert_value_with_inputs(true, nand_node, on_node, off_node)
    assert_value_with_inputs(true, nand_node, off_node, on_node)
    assert_value_with_inputs(true, nand_node, off_node, off_node)
  end

  def test_nor_node
    nor_node = node(:nor)
    on_node = node(:on)
    off_node = node(:off)

    assert_value_with_inputs(false, nor_node, on_node, on_node)
    assert_value_with_inputs(false, nor_node, on_node, off_node)
    assert_value_with_inputs(false, nor_node, off_node, on_node)
    assert_value_with_inputs(true, nor_node, off_node, off_node)
  end

  def test_xor_node
    xor_node = node(:xor)
    on_node = node(:on)
    off_node = node(:off)

    assert_value_with_inputs(false, xor_node, on_node, on_node)
    assert_value_with_inputs(true, xor_node, on_node, off_node)
    assert_value_with_inputs(true, xor_node, off_node, on_node)
    assert_value_with_inputs(false, xor_node, off_node, off_node)
  end

  def test_xnor_node
    xnor_node = node(:xnor)
    on_node = node(:on)
    off_node = node(:off)

    assert_value_with_inputs(true, xnor_node, on_node, on_node)
    assert_value_with_inputs(false, xnor_node, on_node, off_node)
    assert_value_with_inputs(false, xnor_node, off_node, on_node)
    assert_value_with_inputs(true, xnor_node, off_node, off_node)
  end

end
