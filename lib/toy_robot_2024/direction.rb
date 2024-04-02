module ToyRobot2024
  class Direction
    CARDINAL_MOVES = {
      'NORTH' => [0, 1],
      'EAST'  => [1, 0],
      'SOUTH' => [0, -1],
      'WEST'  => [-1, 0]
    }
    COMPASS = CARDINAL_MOVES.keys

    def initialize(direction)
      @direction = direction
    end

    def turn(turn)
      current_idx = COMPASS.index(direction)
      case turn.chomp
      when "LEFT"
        COMPASS[current_idx - 1]
      when "RIGHT"
        COMPASS[(current_idx + 1) % COMPASS.length]
      end
    end

    def cardinal_move
      CARDINAL_MOVES[direction]
    end

    private

    attr_reader :direction
  end
end
