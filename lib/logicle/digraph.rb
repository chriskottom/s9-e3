module Logicle
  class Digraph
    attr_reader :nodes, :edges

    def initialize
      @nodes, @edges = {}, {}
    end

    def evaluate
      outputs.each_value do |output|
        output.state
      end
    end

    def inputs
      @nodes.select { |id, node| node.switch? }
    end

    def outputs
      @nodes.select { |id, node| node.bulb? }
    end

    def add_node(id, node_type)
      @nodes[id] = Node.new(id, node_type)
    end

    def add_edge(start_id, end_id)
      start_node, end_node = @nodes[start_id], @nodes[end_id]

      if start_node && end_node 
        end_node.append_input(start_node)
        @edges[start_id] = end_id
        true
      else
        raise_unknown_nodes(start_id => start_node, end_id => end_node)
      end
    end

    private
    def raise_unknown_nodes(node_map={})
      bad_node_ids = node_map.select { |id, node| node.nil? }.keys 

      case bad_node_ids.count
      when 0
        return
      when 1
        raise UnknownNodeError, "Invalid node id: #{ bad_node_ids[0] }"
      else
        raise UnknownNodeError, "Invalid node ids: #{ bad_node_ids.join(", ") }"
      end
    end
  end
end
