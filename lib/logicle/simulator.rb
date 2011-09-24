module Logicle
  class Simulator
    attr_reader  :circuit

    def inputs
      @circuit.inputs
    end

    def outputs
      @circuit.outputs
    end

    def load(circuit_file)
      reader = TgfReader.new(circuit_file)
      @circuit = reader.parse
    end

    def evaluate
      @circuit.evaluate
    end

    def save_solution(output_file)
      writer = TgfWriter.new(output_file, @circuit)
      writer.write
    end
  end
end
