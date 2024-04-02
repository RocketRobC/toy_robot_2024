RSpec.describe ToyRobot2024::FileInterpreter do
  let(:file_data) { StringIO.new(move_data) }
  let(:int_moves) { ToyRobot2024::FileInterpreter.new(file_data) }

  context 'for a placement' do
    let(:move_data) { 'PLACE 1,2,WEST' }

    it 'detects a place command' do
      int_moves.each_move do |move|
        expect(move).to eq([:place, ['1', '2', 'WEST']])
      end
    end
  end

  context 'for a move' do
    let(:move_data) { 'MOVE' }

    it 'detects a move command' do
      int_moves.each_move do |move|
        expect(move).to eq(:move)
      end
    end
  end

  context 'for a turn' do
    context 'to the left' do
      let(:move_data) { 'LEFT' }

      it 'detects a left command' do
        int_moves.each_move do |move|
          expect(move).to eq([:turn, 'LEFT'])
        end
      end
    end

    context 'to the right' do
      let(:move_data) { 'RIGHT' }

      it 'detects a right command' do
        int_moves.each_move do |move|
          expect(move).to eq([:turn, 'RIGHT'])
        end
      end
    end
  end

  context 'for a report' do
    let(:move_data) { 'REPORT' }

    it 'detects a report command' do
      int_moves.each_move do |move|
        expect(move).to eq(:report)
      end
    end
  end
end
