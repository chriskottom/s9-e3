module Logicle
  class TgfReader
    def initialize(filename)
      file = File.open(filename, "rb")
      @contents = file.read
    end

    def parse
      @nodes = {}
      reading_nodes = true

      @contents.lines.each do |line|
        if line =~ /\A#/
          reading_nodes = false
          next
        elsif reading_nodes
          node_directive(line)
        else
          edge_directive(line)
        end
      end
    end

    private
    def node_directive(text)
      if text =~ /\A(\d+)\s+(.*)\Z/
        id, label = $1, $2
        # TO-DO
      else
        raise ParseError, "Unable to parse TGF node directive: #{ text }"
      end
    end

    def edge_directive(text)
      if text =~ /\A(\d+)\s+(\d+)\Z/
        start, finish = $1, $2
        # TO-DO
      else
        raise ParseError, "Unable to parse TGF edge directive: #{ text }"
      end
    end
  end
end

