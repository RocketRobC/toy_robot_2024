module ToyRobot2024
  class App

    def initialize(board, interpreted_input, outputer)
      @board = board
      @interpreted_input = interpreted_input
      @outputer = outputer
    end

    def run
      interpreted_input.each_move do |move|
        command = Array(move)
        next unless command.include?(:place) || board.placed?

        send(*command)
      end
      self
    end

    def final_position
      outputer.report_position
    end

    private

    attr_reader :board, :interpreted_input, :outputer

    def place(position)
      x, y, direction = position
      board.set_position(x, y, direction)
    end

    def move
      move_x, move_y = Direction.new(board.direction).cardinal_move
      new_x = board.x_pos + move_x
      new_y = board.y_pos + move_y
      board.set_position(new_x, new_y, board.direction)
    end

    def turn(direction)
      new_dir = Direction.new(board.direction).turn(direction)
      board.set_position(board.x_pos, board.y_pos, new_dir)
    end

    def report
      outputer.report(board)
    end
  end
end
