module Logicle
  class Node
    LOGIC_OPERATIONS = {
      on:   Proc.new { |args| true },
      off:  Proc.new { |args| false },
      not:  Proc.new { |args| !args[0].state },
      and:  Proc.new { |args| args[0].state & args[1].state },
      or:   Proc.new { |args| args[0].state | args[1].state },
      nand: Proc.new { |args| !args[0].state | !args[1].state },
      nor:  Proc.new { |args| !args[0].state & !args[1].state },
      xor:  Proc.new { |args| args[0].state ^ args[1].state },
      xnor: Proc.new { |args| !(args[0].state ^ args[1].state) }
    }

    attr_reader :type, :inputs
    #attr_reader :type

    def initialize(type)
      @type = type
      @inputs = []
    end

    def append_inputs(*nodes)
      @inputs += nodes
    end
    alias_method :append_input, :append_inputs

    def clear_inputs
      @inputs = []
      @state = nil
    end

    def state
      @state ||= evaluate
    end

    private
    def evaluate
      operation = LOGIC_OPERATIONS[@type]
      operation.call(@inputs)
    end
  end
end
