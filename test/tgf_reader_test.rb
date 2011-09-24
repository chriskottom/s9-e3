require_relative "test_helper"

require "test/unit"


class TgfReaderTest < Test::Unit::TestCase
  include TestHelper

  def test_initialization_with_filename
    filename = File.join(File.dirname(__FILE__), "simple.tgf")
    file_content = File.readlines(filename)

    assert_equal(file_content,
                 tgf_reader(filename).instance_variable_get(:@contents))
  end

  def test_initialization_with_string
    assert_equal(tgf_content.lines.to_a,
                 tgf_reader.instance_variable_get(:@contents).to_a)
  end

  def test_parsing
    circuit = tgf_reader.parse

    node_lines, edge_lines = tgf_content.split(/#\s*\n/)

    assert_equal(node_lines.chomp.lines.count,
                 circuit.instance_variable_get(:@nodes).count)
    assert_equal(edge_lines.lines.count,
                 circuit.instance_variable_get(:@edges).count)
  end

  def test_parsing_with_bad_node_type
    content = "0 FOO\n" << tgf_content
    assert_raises(Logicle::ParseError) do
      tgf_reader(content).parse
    end
  end

  def test_parsing_with_bad_edge
    content = tgf_content << "\n10000 100001"
    assert_raises(Logicle::ParseError) do
      tgf_reader(content).parse
    end
  end
end
