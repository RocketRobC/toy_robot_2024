module ToyRobot2024
  class Board
    attr_reader :x_pos, :y_pos, :direction

    def initialize(x_size:, y_size:)
      @x_size = x_size
      @y_size = y_size
      @x_pos = nil
      @y_pos = nil
      @direction = 'NORTH'
    end

    def valid_placement?(placed_x, placed_y)
      (0..x_size).include?(placed_x.to_i) && (0..y_size).include?(placed_y.to_i)
    end

    def placed?
      x_pos && y_pos
    end

    def set_position(x, y, direction)
      return unless valid_placement?(x, y)

      @x_pos = x.to_i
      @y_pos = y.to_i
      @direction = direction
    end

    def to_s
      "#{x_pos},#{y_pos},#{direction}"
    end

    private

    attr_reader :x_size, :y_size
  end
end
