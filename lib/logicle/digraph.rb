module Logicle
  class Digraph
    def initialize
      @nodes, @edges = {}, {}
    end

    def inputs
      @nodes.select { |id, node| node.type == :switch }
    end

    def outputs
      @nodes.select { |id, node| node.type == :bulb }
    end

    def add_node(id, node_type)
      @nodes[id] = Node.new(id, node_type)
      self
    end

    def add_edge(start_id, end_id)
      start_node, end_node = @nodes[start_id], @nodes[end_id]
      if start_node && end_node
        end_node.append_input(start_node)
        @edges[start_id] = end_id
        self
      else
        error_message = ""
        if start_node.nil? && end_node.nil?
          error_message = "Nodes for ids not found: #{ start_id }, #{ end_id }"
        elsif start_node.nil?
          error_message = "Node for id not found: #{ start_id }"
        else
          error_message = "Node for id not found: #{ end_id }"
        end

        raise UnknownNodeError, error_message
      end
    end
  end
end
