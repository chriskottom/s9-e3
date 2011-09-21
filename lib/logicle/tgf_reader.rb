module Logicle
  class TgfReader
    def initialize(filename)
      file = File.open(filename, "rb")
      @contents = file.read
    end

    def parse
      @circuit = Digraph.new
      still_reading_nodes = true

      @contents.lines.each do |line|
        if line =~ /\A#/
          still_reading_nodes = false
          next
        elsif still_reading_nodes
          node_directive(line)
        else
          edge_directive(line)
        end
      end

      @circuit
    end

    private
    def node_directive(text)
      if text =~ /\A(\d+)\s+(.*)\Z/
        id, label = $1, $2
        @circuit.add_node(id, label.downcase.to_sym)
      else
        raise ParseError, "Unable to parse TGF node directive: #{ text }"
      end
    end

    def edge_directive(text)
      if text =~ /\A(\d+)\s+(\d+)\Z/
        start, finish = $1, $2
        @circuit.add_edge(start, finish)
      else
        raise ParseError, "Unable to parse TGF edge directive: #{ text }"
      end
    end
  end
end

