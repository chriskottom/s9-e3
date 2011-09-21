module Logicle
  class Simulator
    attr_accessor  :switches

    def initialize
      @switches = []
    end

    def load_circuits(*circuit_files)
    end

    def load(circuit_file)
    end

    def evaluate(switch_states)
      []
    end

    def save_solution(output_file)
    end
  end
end
