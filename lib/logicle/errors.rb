module Logicle

  # Raised in case of error while reading an input file 
  class ParseError < StandardError; end

  # Raised in case the state of an Element cannot be determined
  class UndefinedStateError < StandardError; end

end
