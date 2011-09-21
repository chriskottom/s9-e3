module Logicle

  # Raised when trying to create an edge in the graph to or from an unknown node
  class UnknownNodeError < StandardError; end

  # Raised in case of error while reading an input file 
  class ParseError < StandardError; end

end
