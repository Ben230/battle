require 'Player'

describe Player do
  subject(:maisie) { Player.new('Maisie') }
  subject(:tillie) { Player.new('Tillie') }

  describe '#name' do
    it 'returns the name' do
      expect(maisie.name). to eq 'Maisie'
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(maisie.hit_points).to eq described_class::DEFAULT_HP
    end
  end

  describe '#receive_damage' do
    it 'reduces the player hit points' do
      expect { maisie.receive_damage }.to change { maisie.hit_points }.by (-10)
    end
  end
end
