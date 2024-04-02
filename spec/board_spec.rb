RSpec.describe ToyRobot2024::Board do
  subject { ToyRobot2024::Board.new(x_size: 4, y_size: 5) }

  context 'for robot placements' do
    it 'successfully validates placement inside the board' do
      expect(subject.valid_placement?(2, 2)).to be true
    end

    it 'fails validation of placements outside the board' do
      expect(subject.valid_placement?(5, 1)).to be false
    end

    it 'returns true if placed' do
      subject.set_position(1, 2, 'SOUTH')
      expect(subject.placed?).to be_truthy
    end

    it 'returns false if not placed' do
      expect(subject.placed?).to be_falsey
    end
  end

  it 'sets the position' do
    subject.set_position(2, 2, 'EAST')
    expect(subject.x_pos).to eq 2
    expect(subject.y_pos).to eq 2
    expect(subject.direction).to eq 'EAST'
  end

  it 'returns a string describing the position' do
    subject.set_position(2, 2, 'EAST')
    expect(subject.to_s).to eq('2,2,EAST')
  end
end
