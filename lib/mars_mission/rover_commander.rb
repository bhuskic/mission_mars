module MarsMission
  class RoverCommander
    attr_reader :rover

    class InvalidInstructionError < StandardError; end

    def initialize(rover:)
      @rover = rover
    end

    def run(instructions:)
      instructions.split('').each do |instruction|
        if instruction == 'M'
          rover.move
        elsif %w(L R).include?(instruction.upcase)
          rover.turn(direction: instruction)
        else
          raise InvalidInstructionError
        end
      end
    end

    def rover_location
      rover.location
    end

    def rover_direction
      rover.direction
    end
  end
end
