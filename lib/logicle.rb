require_relative "logicle/version"
require_relative "logicle/logicle"
require_relative "logicle/simulator"
require_relative "logicle/tgf_reader"
require_relative "logicle/tgf_writer"

require_relative "logicle/node"
require_relative "logicle/digraph"

module Logicle

  # Raised when trying to create an edge in the graph to or from an unknown node
  class UnknownNodeError < StandardError; end

  # Raised in case of error while reading an input file 
  class ParseError < StandardError; end

  # Raised when trying to create a node with an unknown type.
  class UnknownNodeTypeError < StandardError; end
end
