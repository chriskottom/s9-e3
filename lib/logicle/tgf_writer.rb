module Logicle
  class TgfWriter
    def initialize(filename, circuit)
      @output_file = File.open(filename, "w")
      @circuit = circuit
    end

    def write
      @circuit.nodes.values.each { |node| write_node(node) }

      write_separator

      @circuit.edges.each { |start, finish| write_edge(start, finish) }
    end

    private
    def write_node(node)
      id = node.id
      type = case node.type
      when :on, :off 
        "SWITCH"
      else 
         node.type.to_s.upcase
      end
      state = node.state ? "ON" : "OFF"

      @output_file.puts "#{ id } #{ type } (#{ state })"
    end

    def write_separator
      @output_file.puts "#"
    end

    def write_edge(start_id, end_id)
      @output_file.puts "#{ start_id } #{ end_id }"
    end
  end
end
