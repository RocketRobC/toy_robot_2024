module ToyRobot2024
  class TerminalOutput
    NO_POSITION = 'No position to report'

    def initialize(test: false)
      @test = test
    end

    def report_position
      @reported_position || NO_POSITION
    end

    def report(board)
      @reported_position = board.to_s
      return if @test

      puts board
    end
  end
end
