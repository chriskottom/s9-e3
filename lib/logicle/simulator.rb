module Logicle
  class Simulator
    attr_reader  :circuit

    def initialize(*circuits)
      @circuit = load(circuits.shift)
      unless circuits.empty?
        @sub_circuits = circuits.map { |circuit_file| load(circuit_file) }
      end
    end

    def inputs
      @circuit.inputs.values
    end

    def outputs
      @circuit.outputs.values
    end

    def evaluate
      @circuit.evaluate
    end

    def save(output_file)
      writer = TgfWriter.new(output_file, @circuit)
      writer.write
    end

    private
    def load(circuit_file)
      reader = TgfReader.new(circuit_file)
      @circuit = reader.parse
    end
  end
end
