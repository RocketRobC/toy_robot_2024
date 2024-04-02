module ToyRobot2024
  class FileInterpreter
    def initialize(file_iter)
      @file_iter = file_iter
    end

    def each_move
      file_iter.each do |move|
        case move
        when /^PLACE\s(\d,){2}NORTH|EAST|SOUTH|WEST/
          comms = move.split(/\s|,/)[-3..]
          yield [:place, comms]
        when /^MOVE/
          yield :move
        when /^LEFT|^RIGHT/
          yield [:turn, move]
        when /^REPORT/
          yield :report
        else
          next
        end
      end
    end

    private

    attr_reader :file_iter
  end
end
