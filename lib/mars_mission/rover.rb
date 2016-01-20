module MarsMission
  class Rover
    attr_accessor :location, :direction, :x, :y

    TO_RIGHT = %w(N E S W)
    TO_LEFT = %w(N W S E)

    def initialize(location:, direction:)
      @direction = direction
      @location = location
      @x = location[0]
      @y = location[1]
    end

    def turn(direction:)
      if direction.upcase == 'L'
        self.direction = TO_LEFT[TO_LEFT.index(self.direction).next]
      else
        self.direction = TO_RIGHT[TO_RIGHT.index(self.direction).next]
      end
    end

    def move
      case direction
      when 'E'
        self.x += 1
      when 'S'
        self.y -= 1
      when 'W'
        self.x -= 1
      else
        self.y += 1
      end
      self.location = [x, y]
    end
  end
end
