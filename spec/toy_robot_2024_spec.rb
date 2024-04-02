# frozen_string_literal: true
RSpec.describe ToyRobot2024 do
  let(:board) { ToyRobot2024::Board.new(x_size: 4, y_size: 4) }
  let(:file_data) { StringIO.new(move_data) }
  let(:int_moves) { ToyRobot2024::FileInterpreter.new(file_data) }
  let(:app) { ToyRobot2024::App.new(board, int_moves, ToyRobot2024::TerminalOutput.new(test: true)) }

  context 'moves within the board' do
    context 'with one placement' do
      let(:move_data) do
        <<~EOM
          PLACE 1,2,EAST
          MOVE
          MOVE
          LEFT
          MOVE
          REPORT
        EOM
      end

      it { expect(app.run.final_position).to eq('3,3,NORTH') }
    end

    context 'with multiple placements' do
      let(:move_data) do
        <<~EOM
          PLACE 1,2,EAST
          PLACE 3,0,SOUTH
          REPORT
        EOM
      end

      it 'repositions the robot' do
        expect(app.run.final_position).to eq('3,0,SOUTH')
      end
    end
  end

  context 'for moves outside the board' do
    let(:move_data) do
      <<~EOM
        PLACE 2,3,WEST
        MOVE
        MOVE
        RIGHT
        MOVE
        MOVE
        LEFT
        REPORT
      EOM
    end

    it 'continues ignoring out of bounds moves' do
      expect(app.run.final_position).to eq('0,4,WEST')
    end
  end

  context 'ignores moves till valid placement' do
    let(:move_data) do
      <<~EOM
        PLACE -2,2,EAST
        RIGHT
        MOVE
        PLACE 2,2,EAST
        MOVE
        REPORT
      EOM
    end

    it { expect(app.run.final_position).to eq('3,2,EAST') }
  end

  context 'with invalid input commands' do
    let(:move_data) do
      <<~EOM
        PLACE 2,2,WEST
        DOG
        MOVE
        RIGHT
        REPORT
      EOM
    end

    it 'ignore invalid commands and continues' do
      expect(app.run.final_position).to eq('1,2,NORTH')
    end
  end
end
