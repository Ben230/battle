require 'Player'

describe Player do
  subject(:maisie) { Player.new('Maisie') }

  describe '#name' do
    it 'returns the name' do
      expect(maisie.name). to eq 'Maisie'
    end
  end
end
