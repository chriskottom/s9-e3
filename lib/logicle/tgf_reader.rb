module Logicle
  class TgfReader
    def initialize(input)
      if File.exists?(input)
        @contents = File.readlines(input)    # read file for TGF content
      else
        @contents = input.lines              # use string param as TGF content
      end
    end

    def parse
      @circuit = Digraph.new
      still_reading_nodes = true

      @contents.each do |line|
        line.chomp!

        if line =~ /\A#/
          still_reading_nodes = false
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
        raise ParseError, "Unable to parse TGF node directive: '#{ text }'"
      end
    rescue UnknownNodeTypeError
      raise ParseError, "Unknown node type in directive: '#{ label }'"
    end

    def edge_directive(text)
      if text =~ /\A(\d+)\s+(\d+)\Z/
        start, finish = $1, $2
        @circuit.add_edge(start, finish)
      else
        raise ParseError, "Unable to parse TGF edge directive: '#{ text }'"
      end
    end
  end
end

