RSpec.describe ToyRobot2024::Direction do
  describe '#cardinal_move' do
    it { expect(ToyRobot2024::Direction.new('NORTH').cardinal_move).to eq([0, 1]) }
    it { expect(ToyRobot2024::Direction.new('EAST').cardinal_move).to eq([1, 0]) }
    it { expect(ToyRobot2024::Direction.new('SOUTH').cardinal_move).to eq([0, -1]) }
    it { expect(ToyRobot2024::Direction.new('WEST').cardinal_move).to eq([-1, 0]) }
  end

  describe '#turn' do
    it 'turns left from NORTH to WEST' do
      direction = ToyRobot2024::Direction.new('NORTH')
      expect(direction.turn('LEFT')).to eq('WEST')
    end

    it 'turns left from WEST to SOUTH' do
      direction = ToyRobot2024::Direction.new('WEST')
      expect(direction.turn('LEFT')).to eq('SOUTH')
    end

    it 'turns left from SOUTH to EAST' do
      direction = ToyRobot2024::Direction.new('SOUTH')
      expect(direction.turn('LEFT')).to eq('EAST')
    end

    it 'turns left from EAST to NORTH' do
      direction = ToyRobot2024::Direction.new('EAST')
      expect(direction.turn('LEFT')).to eq('NORTH')
    end

    it 'turns right from WEST to NORTH' do
      direction = ToyRobot2024::Direction.new('WEST')
      expect(direction.turn('RIGHT')).to eq('NORTH')
    end

    it 'turns right from NORTH to EAST' do
      direction = ToyRobot2024::Direction.new('NORTH')
      expect(direction.turn('RIGHT')).to eq('EAST')
    end

    it 'turns right from EAST to SOUTH' do
      direction = ToyRobot2024::Direction.new('EAST')
      expect(direction.turn('RIGHT')).to eq('SOUTH')
    end

    it 'turns right from SOUTH to WEST' do
      direction = ToyRobot2024::Direction.new('SOUTH')
      expect(direction.turn('RIGHT')).to eq('WEST')
    end
  end
end
